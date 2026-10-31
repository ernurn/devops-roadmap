# File Ownership and Permissions

## Objectives
- Understand and interpret Linux file permissions (`rwx`) across User, Group, and Other contexts.
- Master permission modifications using both Symbolic (`u+x`, `g-w`) and Numeric/Octal (`640`, `750`, `755`) notation with `chmod`.
- Learn how file ownership (`chown`) and group assignment (`chgrp`) affect resource accessibility.
- Analyze system behavior when encountering access errors without relying on elevated administrative privileges (`sudo`).

---

## Understanding rwx permissions

### Initial State Inspection
Initial workspace inspection revealed two files owned by user `ernurn` and primary group `ernurn`:

```text
-rw-rw-r-- 1 ernurn ernurn 41 Oct 31 15:50 deploy.sh
-rw-rw-r-- 1 ernurn ernurn 18 Oct 31 15:54 notes.txt
```

- **Owner (`ernurn`):** Read and Write access (`rw-`).
- **Group (`ernurn`):** Read and Write access (`rw-`).
- **Others:** Read-only access (`r--`).

### Execution Capability
Even if `deploy.sh` contains valid Bash instructions, running `./deploy.sh` will fail with a `Permission denied` error. This occurs because the file lacks the execute bit (`x`) in its permission mode. Linux strictly enforces the execute flag before permitting the kernel to run a file directly.

---

## Symbolic chmod examples

Symbolic mode allows adding (`+`), removing (`-`), or explicitly setting (`=`) specific permission bits for user classes (`u`, `g`, `o`, `a`):

1. **Granting execute access to the owner:**
   ```bash
   chmod u+x deploy.sh
   ```
   *Result:* Modifies owner permissions from `rw-` to `rwx`.

2. **Revoking execute access from the owner:**
   ```bash
   chmod u-x deploy.sh
   ```
   *Result:* Restores owner permissions back to `rw-`.

3. **Modifying group write permissions:**
   ```bash
   chmod g+w deploy.sh
   # Followed by removal:
   chmod g-w deploy.sh
   ```
   *Key Takeaway:* Symbolic modifications selectively alter individual bit positions without overwriting the entire permission mask.

---

## Numeric chmod examples

Numeric (octal) notation sets the complete permission mask in a single command using base-8 values calculated from binary weights ($4$ for read, $2$ for write, $1$ for execute):

### 1. Mode `640` (`-rw-r-----`)
- **Owner (`6 = 4+2`):** Read and Write (`rw-`). Can inspect and modify file content.
- **Group (`4`):** Read-only (`r--`). Members can view file content but cannot modify or truncate it.
- **Others (`0`):** No access (`---`). Unrelated system users are denied all operations.

### 2. Mode `750` vs Mode `755` for Directories and Scripts
- **Mode `750` (`rwxr-x---`):** Allows full access (`rwx`) to the owner, read and execution/traversal (`r-x`) to group members, and denies all access (`---`) to others. This is a secure configuration for internal team scripts.
- **Mode `755` (`rwxr-xr-x`):** Grants execution/traversal access to all system users (`others`). It is less secure than `750` because it exposes script execution and directory traversal to unprivileged users across the system.

### 3. Directory Access Enforcement (`750`)
If a directory is configured with mode `750`, users who are neither the owner nor members of the assigned group are strictly prohibited from entering or traversing it. Because the `others` class is assigned `0` (`---`), the missing execute bit (`x`) prevents path traversal, rendering underlying files unreachable to unassigned accounts.

---

## File ownership: chown and chgrp

- **`chown` (Change Owner):** Reassigns the individual user owner of a file or directory.
- **`chgrp` (Change Group):** Reassigns the owning group of a file or directory (equivalent to `chown :group`).

### Important Identity Distinction
Changing the owning group of a file using `chgrp` or `chown` **does not** automatically add system users to that group. Modifying file metadata alters ownership flags within the filesystem layer; it has no impact on system identity databases (`/etc/group` or NSS). User group memberships must be explicitly managed using `usermod -aG`.

---

## Verification

File metadata and permissions were verified using `stat` and `ls`:

```bash
ls -l deploy.sh notes.txt
stat -c '%A %a %U %G %n' deploy.sh
```

### Why Execute Bit (`x`) Alone Does Not Guarantee Script Execution
Assigning execution permissions (`+x`) authorizes the kernel to attempt executing a file, but script execution can still fail due to:
1. **Missing Read Permission (`r`):** Interpreters (e.g., `bash`, `python`) must physically read script contents into memory. If read access is denied to the executing user, execution aborts.
2. **Invalid Shebang (`#!`):** If the first line points to a non-existent or misconfigured binary (e.g., `#!/bin/zsh` on a system without Zsh), execution fails.
3. **Internal Script Dependencies:** Syntax errors, unhandled variables, or missing command binaries within the script body will trigger runtime failures despite valid filesystem permissions.

---

## Lessons learned

1. **Permissions vs. Ownership:** Security in Linux relies on two independent layers: user/group identity attributes and filesystem permission masks.
2. **Directory Traversal:** The execute flag (`x`) on directories controls path traversal, not program execution. Without `x` on a directory, files inside cannot be accessed regardless of individual file permissions.
3. **Least Privilege Principle:** Prefer strict numeric modes like `750` or `640` over overly permissive defaults like `777` or `755` when managing sensitive automation scripts.
4. **Structured Troubleshooting:** Always inspect `ls -l` and `stat` outputs before attempting privilege elevation (`sudo`), isolating permission issues from interpreter or script-level bugs.