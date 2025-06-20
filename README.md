# Path of Exile - Inventory to Stash Auto Transfer Macro

This is an AutoHotkey script that lets you **auto-transfer all items** from your inventory into your stash in Path of Exile using `Ctrl + C`. It also ignores 2 slots at the bottom right and the one above for Portal scroll and Wisdom Scroll. Works on all display resolutions as you can set your own coordinates.

---

## ✨ Features

- 🔍 **Alt + G**: Displays your current mouse coordinates to help configure your inventory grid.
- 📦 **Alt + C**: Automatically Ctrl+Clicks every slot in your inventory (except the bottom-right 2), transferring items to your stash tab.
- 🛠️ Skips specific slots to avoid interfering with fixed items like currency stacks or gear.

---

## 🧰 Setup Instructions

### 1. Install AutoHotkey

Download and install AutoHotkey from: [https://www.autohotkey.com/](https://www.autohotkey.com/)

---

### 2. Set Inventory Slot Coordinates

1. **Run the script** (double-click the `.ahk` file).
2. Open Path of Exile and make sure your inventory is open.
3. Hover your mouse **over the center** of the **top-left inventory slot**.
4. Press `Alt + G` → a message box will pop up with the `X` and `Y` coordinates.
5. Copy the values into the script:

   ```ahk
   topLeftX := 920    ; Replace with your value
   topLeftY := 508    ; Replace with your value
   ```

---

### 3. Find Your Inventory Slot Spacing (Delta)

1. Now hover your mouse over the center of the **slot immediately to the right** of the top-left one.
2. Press `Alt + G` again.
3. Subtract the **first X** value from this **new X** value. The result is your `delta`.
4. Set it in the script:

   ```ahk
   delta := 50  ; Replace with your result
   ```

---

### 4. Save and Reload

- Save the script.
- Right-click the AutoHotkey icon in your system tray → click "Reload Script".
- You're ready to use it!

---

## ✅ Usage

- Open your stash tab and inventory in-game.
- Press `Alt + C` to auto-transfer everything (except the last 2 slots).
- The script will:
  - Move the mouse through every slot.
  - Simulate `Ctrl + Click` to move items to the stash.
  - Skip the bottom-right 2 slots (row 3 and 4, column 10).

---

## 🔐 Safety Note

- The script only runs while **Path of Exile is the active window**.
- It blocks input while running to prevent accidental clicks.

---

## 💡 Advanced Users

Want to skip different or more slots? You can add more conditions inside the nested loop:

```ahk
if ((row = 3 || row = 4) && col = 10)
    continue
```


## 📄 License

This script is provided as-is for personal use. Modify it freely. Contributions welcome!

---
