# Notepad Browser

Welcome to **Notepad Browser**! This project lets you browse the web (or your own personal site library) directly in **Notepad**. It's a fun and simple way to access text-based content using a basic tool that many of us use every day.

---

## 🚀 Features

- Browse sites in **Notepad**
- Easy updates from a **central server** or your **own custom server**
- Create and update your own site library through **GitHub** or any server that hosts text files

---

## 👨‍💻 How to Use

1. **Download the Project Files**:
   - Go to the **GitHub repository** for this project.
   - Click on **Code** and select **Download ZIP**.
   - Extract the ZIP file to a folder on your computer.

2. **Run the Script**:
   - Open **PowerShell** (make sure it's version 5.1 or later).
   - Navigate to the folder where you extracted the files using the `cd` command.
   - Run the PowerShell script:
     ```powershell
     .\update.ps1
     ```

3. **Choose a Server**:
   - When prompted, select between the **main server** or enter the **URL of your custom server**.
   - The script will download `sites.txt`, which contains the list of sites.
   - After downloading, the script will fetch and update each site's content in your local `app\pages\txt\` folder.

4. **Clean Up**:
   - After the update, the script will automatically delete the `sites.txt` file for you to keep things tidy!

---

## 🛠 How to Set Up Your Own Server

If you want to host your own server for serving the site data, you can easily set it up using **GitHub**. Here’s how:

### Step 1: Create a GitHub Repository

1. Go to [GitHub](https://github.com) and log in.
2. Create a **new repository** (e.g., `MyNotepadBrowserServer`).
3. Make the repository **public** if you want others to access it, or private if it's for your personal use.

### Step 2: Add Your Sites

1. In your repository, create a folder called `server` (this will be the root directory for your server).
   
2. Inside `server`, create a file called `sites.txt`. This file will contain the names of all the sites you want to make available.
   - Example:
     ```
     site1
     site2
     site3
     ```

3. For each site listed in `sites.txt`, create a folder with the site's name, and inside each folder, create a file called `page.txt`. This will contain the content for that site.
   - Example:
     ```
     server/
     ├── sites.txt
     ├── site1/
     │   └── page.txt
     ├── site2/
     │   └── page.txt
     └── site3/
         └── page.txt
     ```

### Step 3: Push Your Files to GitHub

1. Commit your changes to the GitHub repository and push them.
2. Once your repository is online, you can now access it with the URL:
   ```
   https://raw.githubusercontent.com/YourUsername/YourRepo/main/server/
   ```

### Step 4: Update the Script

- When running the `update.ps1` script, enter the custom server URL like this:
  ```
  https://raw.githubusercontent.com/YourUsername/YourRepo/main/server/
  ```
- The script will download the `sites.txt` file and update each site's content.

---

## 💖 Credits

- **Notepad** is made by **Microsoft**! I use Notepad every day, so I have to thank Microsoft! Thanks for making a wonderful program ❤️
  
---

## 📄 License

This project is open source and available under the MIT License. See the [LICENSE](LICENSE) file for more information.

---

## 🤔 Feedback & Contributions

Feel free to open issues or submit pull requests if you want to contribute to this project!
