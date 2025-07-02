# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a Hardhat Ignition module that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat ignition deploy ./ignition/modules/Lock.js
```

---

# 🔒 Secure Vault

A secure Ethereum smart contract that allows users to deposit and withdraw ETH — protected against **reentrancy attacks**, with **static security analysis** using **Slither**.

---

## 📌 Objective

- Create a smart contract that securely stores ETH for users.
- Implement secure withdrawal using OpenZeppelin's `ReentrancyGuard`.
- Perform static analysis using Slither to detect common vulnerabilities (e.g., reentrancy, uninitialized storage, gas inefficiencies).

---

## 🧠 Important Concepts You Should Know

🔁 Reentrancy : An attacker repeatedly calls a function before its first call finishes. Prevent using `nonReentrant`. 
🔢 Integer Overflow/Underflow : A number wraps around its limit (not an issue in Solidity ≥0.8 due to built-in checks). 
🔐 Best Practice : Always use **Checks-Effects-Interactions** pattern and **OpenZeppelin libraries**. 
🧪 Static Analysis : Tools like Slither can find vulnerabilities **without executing** the code. 

---

## 🛠 Tech Stack

- Solidity ^0.8.x
- Hardhat (for development/testing)
- OpenZeppelin Contracts
- Slither (for static analysis)

---

## 🚀 Getting Started

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/KP081/SecureVault.git
cd SecureVault
```

### 2️⃣ Install Dependencies

```bash
npm install --save-dev hardhat
npm install --save @openzeppelin/contracts
```

### 3️⃣ Compile Contracts

```bash
npx hardhat compile
```

---

## 🔍 Slither Installation Guide

### 💻 Windows Installation

#### ✅ Option 1: Use WSL (Recommended)

## ✅ Step 0: Ensure WSL is Installed and Set Up

> WSL lets you run a Linux environment directly on Windows — perfect for dev tools like Slither.

---

### 📦 Step 0.1: Install WSL (if not already)

Open **PowerShell (Admin)** and run:

```powershell
wsl --install
```

This will:

* Install WSL
* Install Ubuntu by default
* Prompt restart after installation

After reboot, WSL will set up Ubuntu and ask you to create a Linux username & password.

---

### 📦 Step 0.2: Open WSL

Open **Ubuntu** from the Start menu or run:

```bash
wsl
```

---

## ✅ Step 1: Update System Packages

In your WSL terminal:

```bash
sudo apt update && sudo apt upgrade -y
```

---

## ✅ Step 2: Install Python & pip

```bash
sudo apt install python3 python3-pip -y
```

Verify:

```bash
python3 --version
pip3 --version
```

---

## ✅ Step 3: Install Git

```bash
sudo apt install git -y
```

Verify:

```bash
git --version
```

---

## ✅ Step 4: Install Slither Globally

Now install Slither using pip:

```bash
pip3 install slither-analyzer
```

---

## ✅ Step 5: Verify Installation

```bash
slither --version
```

Expected output:

```
slither v0.x.x
```

🎉 **Success! Slither is now installed inside WSL.**

---

#### ✅ Option 2: Windows Native (with Python)

### ✅ Step 1: Install Python

1. Go to [https://www.python.org/downloads/windows/](https://www.python.org/downloads/windows/)
2. Download the **latest Python 3** installer.
3. IMPORTANT: **During installation**, **check the box**:

   ```
   [x] Add Python to PATH
   ```
4. Complete the installation.

### ✅ Step 2: Verify Python & pip

Open **Command Prompt** (`cmd`) and run:

```bash
python --version
pip --version
```

Expected output:

```
Python 3.x.x
pip x.x
```

---

### ✅ Step 3: Install Git

If Git is not already installed:

1. Go to [https://git-scm.com/download/win](https://git-scm.com/download/win)
2. Download and install Git for Windows (accept all defaults)
3. After install, verify:

```bash
git --version
```

---

### ✅ Step 4: Install Slither Globally Using pip

Run this in Command Prompt:

```bash
pip install slither-analyzer
```

This will install Slither globally in your Python environment.

---

### ✅ Step 5: Verify Slither Installation

```bash
slither --version
```

Expected output:

```
slither v0.x.x
```

🎉 You have successfully installed Slither!

---

## ⚠️ Common Issues & Fixes

### ❌ `slither` is not recognized?

✅ Add Python Scripts to your PATH manually:

1. Open **System Environment Variables**

2. Go to `System Properties > Advanced > Environment Variables`

3. Under `System Variables`, find `Path`, click **Edit**

4. Add both:

   ```
   C:\Users\YourUsername\AppData\Local\Programs\Python\Python3x\Scripts\
   C:\Users\YourUsername\AppData\Local\Programs\Python\Python3x\
   ```

5. Open new terminal and try again:

   ```bash
   slither --version
   ```

---

### 🍎 macOS Installation

### ✅ Step 1: Install Homebrew (if not already)

Open **Terminal** and run:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Once done, add Homebrew to your shell config (it will guide you).

Verify:

```bash
brew --version
```

---

### ✅ Step 2: Install Python 3 and pip

```bash
brew install python
```

Verify:

```bash
python3 --version
pip3 --version
```

---

### ✅ Step 3: Install Git (if not installed)

Most macOS versions already have Git. If not:

```bash
brew install git
```

Verify:

```bash
git --version
```

---

### ✅ Step 4: Install Slither Globally

```bash
pip3 install slither-analyzer
```

This installs Slither and all dependencies globally.

---

### ✅ Step 5: Verify Installation

```bash
slither --version
```

Expected output:

```
slither v0.x.x
```

🎉 **You're done! Slither is now installed globally on macOS.**

---

---

## 🧪 Example: Use Slither in a Project(any OS)

### 📁 Navigate to your project:

```bash
cd Project_Path
```

### 🔍 Run Slither:

```bash
slither contracts/YourContract.sol
```

### 📝 Optional - Save report:

```bash
slither contracts/YourContract.sol --print human-summary > slither-report.txt
```

---

## 🧪 Run Static Analysis with Slither

### Step-by-Step:

1. **Compile contracts using Hardhat**:

   ```bash
   npx hardhat compile
   ```

2. **Run Slither** on your contract:

   ```bash
   slither ./contracts/SecureVault.sol
   ```

3. **Optional - Generate report**:

   ```bash
   slither ./contracts/SecureVault.sol --print human-summary > slither-report/summary.txt
   ```

4. **Fix any warnings** shown by Slither.

---

## ✅ Best Practices Checklist

* [x] Use `nonReentrant` from `ReentrancyGuard`
* [x] Avoid calling external contracts before state updates
* [x] Avoid using `tx.origin` for authentication
* [x] Avoid uninitialized storage pointers
* [x] Use `require()` to validate inputs
* [x] Use `call` for ETH transfer (not `transfer()`)

---

## 🛡 Stay Secure

> "Security is not a feature — it's a mindset."

Happy codeing! 💻