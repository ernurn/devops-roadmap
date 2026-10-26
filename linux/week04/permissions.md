# Linux Permissions and Access Control Documentation (`Day 20`)

---

## 1. Interpreting `rwx` Permissions
File and directory permissions in Linux are categorized into three core capabilities, represented by specific characters in the permission string:
- **`r` (Read):** Grants authorization to view the contents of a file or list the filenames contained within a directory.
- **`w` (Write):** Authorizes modification, overwriting, or truncation of file data. In the context of a directory, it allows creating, deleting, or renaming entries inside it (subject to other system controls).
- **`x` (Execute):** Permits the kernel to run a file as an executable program or shell script. For directories, `x` acts as a traversal flag—it does not execute the directory, but rather allows users and processes to cross through it to access underlying nested paths or files.

---

## 2. Access Levels: Owner, Group, and Others
Linux divides access control into three distinct tiers to balance security and collaboration:
- **Owner (User - `u`):** Typically the creator or administrative entity responsible for the file. The owner possesses primary authority and can modify permissions without administrative elevation (`sudo`).
- **Group (`g`):** A collection of user accounts associated with a specific project, department, or administrative boundary. This tier facilitates collaborative sharing among multiple users without opening access to the entire system.
- **Others (`o`):** Every other user account on the system that does not fall under the owner category or the assigned group. Access for this tier should be restricted tightly to maintain system security.

---

## 3. Differences Between File and Directory Permissions
While the permission characters (`rwx`) are identical in appearance, their functional impact varies fundamentally depending on the target object type:
- **Files:** `r` reads byte content; `w` modifies byte content; `x` executes compiled binaries or interpreted scripts.
- **Directories:** `r` enables listing catalog entries (`ls`); `w` enables modifying the directory table (creating or removing files); `x` enables traversal (accessing metadata or files inside the directory via paths). Without execution (`x`) rights on a directory, a user cannot access files inside it even if they possess explicit read rights on the files themselves.

---

## 4. Modifying Permissions with `chmod`
Permissions can be altered using two distinct syntaxes:
- **Symbolic Mode:** Targets specific user classes (`u`, `g`, `o`, `a`) and applies operations (`+` to add, `-` to remove, `=` to set exact values). Example: `chmod u+x,g-w file.sh`.
- **Numeric (Octal) Mode:** Uses a three-digit base-8 value representing owner, group, and others respectively, calculated from binary weights ($4$ for read, $2$ for write, $1$ for execute). Example: `chmod 640 demo.txt` assigns read/write to the owner, read-only to the group, and no permissions to others.

---

## 5. System Verifications: `ls -l`, `stat`, and `umask`
Through practical testing, each tool revealed specific metadata layers:
- **`ls -l`:** Provides a quick visual summary of file types, symbolic permission strings, hard link counts, ownership, size, and modification timestamps.
- **`stat`:** Extracts deeper filesystem details, including precise numeric UIDs/GIDs, inode numbers, access/modify/change timestamps, and explicit octal permission masks.
- **`umask`:** Acts as a subtraction filter applied during file and directory creation, explaining why newly created files default to stricter permissions (e.g., `664` or `644`) compared to directories (`775` or `755`) by stripping execution permissions from files by default.

---

## 6. Mini-Challenge: Troubleshooting Script Execution Errors
- **The Scenario:** A custom shell script (`run-me.sh`) executed successfully when called explicitly via interpreter (`bash run-me.sh`), but failed with a "Permission denied" error when invoked directly via relative path (`./run-me.sh`).
- **Diagnosis:** Running `ls -l run-me.sh` confirmed that the file lacked execution (`x`) permissions for the owner. 
- **Resolution:** When calling `bash run-me.sh`, the user is merely passing the file as a text argument to the `bash` binary (which only requires read permissions). Conversely, executing `./run-me.sh` requires the Linux kernel to read the shebang (`#!/bin/bash`) and directly execute the file, which strictly mandates execute permissions (`x`). The issue was resolved by applying `chmod u+x run-me.sh`.

