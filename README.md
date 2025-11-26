Multi-User Linux Server With Role-Based Access & Automation.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Covers Concepts:
1. Linux File System Structure (FHS)
2. User Accounts, Groups, and Permissions
3. File Navigation & Management
4. Package Management (Installing/Updating Software)
5. System Service (systemd)
6. Disk Management & Storage
7. Shell Scripting Basics 
8. Remote Access: SSH & Keys
9. Cron Jobs (Scheduled Automation)
10. Troubleshooting Mindset & Tools

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Real-World Problem to Solve
A small company needs: 
    • Multiple users with different access levels
    • Secure SSH login
    • Shared departments directories
    • Automated Backups 
    • A monitored service that stays online
    • Basic troubleshooting logs
    • disk usage monitoring. 

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

This project pretend to mock a scenario where you are the new junior sysadmin – You build and maintain this server. 
Project Tasks
1) Set up the server (EC2 Amazon Linux)
    • Update system 
    • Configure hostname 
    • Create directory structure for departments (/depth/hr, dept/finance, etc.)
2) Build user & group roles
Create user for 3 “employees” and groups: 
    • HR team → read/write access to /dept/hr
    • Finance team → read/write access to /dept/finance
    • Deny cross-access
    • One “intern” user → read-only access to a shared folder
3) Secure SSH access
    • Disable password login
    • Require SSH keys
    • Change default SSH port
    • Set idle timeout
    • Configure /etc/sudoers with least privileges rules.
4) Set up a monitored service
    • Install a simple service (Apache, Nginx, or a custom bash service)
    • Enable and start it (systemctl)
    • View logs with journalctl
    • Simulate a failure → fix it
5) Automatic nightly backups
Use cron + tar to compress /dept directory every night to /backups with data in filename.
6) Disk monitoring script
Write a bash script:
    • Checks df -h
    • Send alert email/log entry if disk > 80%
7) Log management
    • Explore /var/log
    • use grep to investigate failed SSH login attempts 
    • Compress old logs

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Summary of Steps
1. Launch EC2 → SSH in
2. Create users → Configure permissions
3. Harden SSH → Configure sudo
4. Install a service → enable and monitor it
5. Create backup script + cron job
6. Create Disk monitor scripts
7. Document troubleshooting steps. 
