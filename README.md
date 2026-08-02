# 📚 Open Source Course & Tool Collection

Welcome to the repository storing my coursework, documents (for the Open Source subject), and a collection of command-line interface (CLI) tools and scripts I developed to optimize my daily workflow.

## 📂 Repository Structure

The repository is divided into the following main components:

### 1. 💻 CLI Tools (Golang & Others)
The `cli-tools/` directory contains command-line tools built with Go and other integrations:
*   **`get-computer-information`**: Quickly retrieves hardware and OS details (Hostname, Platform, CPU, RAM, Disk).
*   **`live-server-local`**: Runs a local server similar to VSCode's Live Server. You can point it to any directory using the `-path=` flag. It supports auto-refresh (requires adding `<meta http-equiv="refresh" content="5">` to your HTML file).
*   **`todo-app`**: A terminal-based task management app using `boltDB` that supports setting task priorities (`-priority`).
*   **`Pomodoro Timer`**: A focus-enhancing app with multiple modes:
    *   *Easy*: 20 minutes.
    *   *Medium Rare*: 30 minutes.
    *   *Supper Egg*: An extreme challenge with 4 hours of continuous work.
    *   *Default break*: 20 minutes of rest with lofi music.
*   **`kaggle-cli`**: A command-line tool integrated to seamlessly interact with Kaggle. It allows you to quickly download datasets, manage machine learning competitions, and submit your predictions directly from your terminal without opening a browser.

### 2. 🛠️ Bash & Shell Scripts
Automation scripts that run directly on your Terminal:
*   **YouTube Audio Downloader & Player**: Uses `yt-dlp` to download (`download-youtube-audio.bash`) and play (`play-audio.bash`) MP3 files from YouTube. 
    *   *Recent Update:* Integrated a user-friendly dialog interface; requires Python >= 3.8.
*   **`connect_HDMI.bash`**: Automatically detects and outputs your display to the `HDMI-0` port (same-as mode) if a device is connected.
*   **`change-swap-size/`**: Provides manual configuration instructions and a `setup_swap_zram.sh` script to automatically create a 12GB swap file, as well as install and enable `zramswap` to optimize memory usage.

### 3. 🎵 Audio Management Guidelines (`audio/`)
The `audi.md` document defines how to properly manage audio resources for projects:
*   **Directory Structure**: 
    *   `/raw`: Original, unprocessed audio.
    *   `/processed`: Audio with adjusted volume.
    *   `/effects`: Short sound effects (SFX).
*   **Technical Standards**: `.mp3` or `.wav` formats, 44.1 kHz, 16-bit.
*   **Naming Convention**: `[audio_type]-[file_name]-[version].[extension]` (e.g., `bgm-main-theme-v1.mp3`).
*   **Important Notes**: The maximum file size for Git pushes is 50MB (Git LFS is highly recommended for larger files), and all files must strictly comply with copyright laws.

---

