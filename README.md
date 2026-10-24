# Hydra Wrapper 🐉

An interactive Bash wrapper for [THC Hydra](https://github.com/vanhauser-thc/thc-hydra) that simplifies command construction through an interactive terminal interface.

This project was built to develop my Bash scripting skills, explore cybersecurity automation, and improve my understanding of penetration-testing workflows.

## ⚠️ WARNING — AUTHORIZED USE ONLY

**Always obtain explicit authorization before testing any target with this tool.**

- Never target systems, accounts, or networks without permission.
- Unauthorized password-guessing attempts may be illegal.
- Repeated login attempts can trigger security alerts, account lockouts, or service disruption.
- Use this tool only in your own lab, on systems you own, or in environments where testing is explicitly authorized.

**Educational purposes only.** You are responsible for how you use this tool. The author does not condone unauthorized activity.

## ✨ Features

- **Interactive prompts** — Configure Hydra without manually assembling every argument.
- **Target configuration** — Enter an IP address or hostname.
- **Optional port** — Specify a custom port or leave it blank.
- **Username selection** — Use a single username (`-l`) or a username list (`-L`).
- **Password selection** — Use a single password (`-p`) or a password list (`-P`).
- **Service configuration** — Specify a Hydra-supported service or module.
- **Extra arguments** — Provide additional Hydra command-line options.
- **Command preview** — Review the generated command before execution.
- **Colored terminal output** — Display informational messages and errors clearly.
- **Dependency check** — Detect whether Hydra is installed before continuing.

## 🛠️ Built With

- **Bash** — Interactive scripting and command construction.
- **THC Hydra** — Network authentication testing tool.
- **Linux** — Recommended environment for running the script.

## 📋 Requirements

- Linux environment, such as Kali Linux, Debian, or Ubuntu.
- Bash shell.
- THC Hydra installed and available in your `PATH`.
- Authorization to test the selected target.

## 📦 Installation

### 1. Install Hydra

On Debian-based distributions:

```bash
sudo apt update
sudo apt install hydra
```

Verify the installation:

```bash
hydra -h
```

### 2. Clone the repository

```bash
git clone https://github.com/assassin222/hydra_wrapper.git
cd hydra_wrapper
```

### 3. Make the script executable

```bash
chmod +x hydra.sh
```

## 🚀 Usage

Start the interactive wrapper:

```bash
./hydra.sh
```

The script guides you through the configuration process.

### Configuration workflow

**1. Target**

Enter the IP address or hostname of the authorized test system.

**2. Port**

Enter a custom port if required, or press Enter to leave the port unspecified.

**3. Username**

Choose between a single username and a username list.

**4. Password**

Choose between a single password and a password list.

**5. Service**

Specify the appropriate Hydra service or module, such as SSH or FTP.

**6. Additional arguments**

Optionally supply extra Hydra arguments.

**7. Review and execute**

The wrapper displays the assembled command and waits for confirmation before launching Hydra.

## ⚙️ How It Works

1. Checks whether Hydra is installed.
2. Collects configuration through interactive prompts.
3. Validates required fields and checks that selected wordlist files exist.
4. Constructs a Hydra command using the supplied options.
5. Displays the generated command for review.
6. Executes the command and reports the exit status.

## 🔒 Security Considerations

This is a learning project rather than a production-grade security application.

The current implementation uses `eval` to execute the constructed command. Because input is incorporated into that command, unexpected shell syntax could cause unintended command execution.

**Recommended improvement:** replace string-based command construction and `eval` with a Bash array and execute it directly. Additional improvements should include input validation and safer handling of sensitive values.

## 🤝 Feedback and Contributions

I'm continuously learning Bash scripting, Python, and cybersecurity through hands-on projects.

Suggestions, constructive feedback, and contributions are welcome. If you notice an issue or have an idea for improvement, feel free to open an issue or submit a pull request.

## 📜 Disclaimer

This project is intended for educational purposes and explicitly authorized security testing only. The author does not encourage unauthorized access, credential attacks, or other illegal activity and is not responsible for misuse of this software.

## 👨‍💻 Author

Cybersecurity learner focused on penetration testing, Linux, Bash, and Python.

**If you find this project useful, consider starring the repository ⭐ and sharing suggestions for improvement.**
