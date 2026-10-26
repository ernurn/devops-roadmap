# Linux User and Group Management (`Day 21`)

---

## 1. Practice Objective
* **Goal:** Master the administration of user accounts, group lifecycles, and access control policies in Ubuntu Server via command-line interface (CLI).
* **Scope:** Understand the underlying mechanics of kernel-level identifiers (UID/GID), Name Service Switch (NSS) databases, and file ownership attribution.

---

## 2. Differences Between UID, GID, and Supplemental Groups
* **UID (User ID):** A unique integer assigned by the Linux kernel to identify a user account. System security enforcement and kernel-level access checks rely strictly on numeric UIDs rather than text login names.
* **Primary GID (Group ID):** The default group assigned to a user during account creation (stored in `/etc/passwd`). Any new file or directory created by the user is automatically assigned this group ownership by default.
* **Supplemental (Secondary) Groups:** Additional groups listed in `/etc/group` that a user belongs to. They grant cross-functional access to shared resources (e.g., `sudo`, `docker`, or specific project directories) without altering the user's primary context.

---

## 3. Commands Used and Their Purpose
* **`whoami`**: Prints the effective username of the active terminal session.
* **`id`**: Displays real and effective numeric UIDs, GIDs, and complete group membership lists.
* **`getent`**: Queries Name Service Switch administrative databases (such as `passwd` and `group`) across local and remote sources.
* **`groupadd`**: Creates a new group entry in the system databases.
* **`useradd`**: Creates a new user account, specifying options such as default shell, home directory, and primary group.
* **`usermod`**: Modifies attributes of an existing user account (such as adjusting secondary group memberships).
* **`chage`**: Inspects and modifies password aging and account expiration policies.
* **`userdel`**: Removes user accounts and optionally purges their home directories and mail spools (`-r`).
* **`groupdel`**: Deletes groups from the system, supporting options to force removal even if it is a user's primary group (`-f`).

---

## 4. Verification Results (Sanitized)
* **Isolated Environment Setup:** Created test entities including primary group `labteam21`, supplemental group `labops21`, and test accounts `labuser21` and `labtech21`.
* **Account Identity Inspection (`id labuser21`):**
```text
  uid=1001(labuser21) gid=1001(labteam21) groups=1001(labteam21),1002(labops21)
```
* **Database Record Inspection (getent passwd labuser21):**
```text
labuser21:x:1001:1001::/home/labuser21:/bin/bash
```
* **Home Directory Verification (ls -ld /home/labuser21):**
```text
drwxr-x--- 2 labuser21 labteam21 4096 Oct 26 17:00 /home/labuser21
```

---

## 5. Errors Encountered and Investigation
* **Error 1: Misusing `groups` with a group name**
  * *Symptom:* Running `groups adm` returned `groups: ‘adm’: no such user`.
  * *Investigation:* Reviewed `man groups` and confirmed that the command expects a *username* argument, not a group name.
  * *Resolution:* Queried group membership using `getent group adm` instead.
* **Error 2: Group deletion syntax restrictions**
  * *Symptom:* Passing multiple group names simultaneously to `groupdel` returned usage errors (`Usage: groupdel [options] GROUP`).
  * *Investigation:* Verified that `groupdel` processes exactly one group argument per execution.
  * *Resolution:* Executed deletions sequentially or through a shell loop.

---

## 6. Conclusion: Why `usermod -aG` Is Critical
* **The Danger of `-G` Alone:** If `usermod -G secondary_group user` is executed without the `-a` flag, the system completely overwrites the user's secondary group list, removing them from all previously assigned supplemental groups (such as `sudo`, `docker`, or administrative teams), leading to accidental privilege loss.
* **The Safety of `-aG`:** Combining `-a` (`--append`) with `-G` forces the system to append the new group to the existing membership list while preserving prior access rights, ensuring operational stability and access integrity in production environments.

