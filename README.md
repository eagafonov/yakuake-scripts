# Collection of scripts to control [Yakuake](https://kde.org/applications/en/system/org.kde.yakuake)

## Dependencies

- `qdbus` or `qdbus-qt5` (for KDE communication)
- `fzf` (fuzzy finder) - required for interactive tab switching with `switch-tab.sh`

## Scripts

- `open-new-tab.sh` - Opens a new Yakuake tab
- `rename-current-tab.sh` - Renames the currently active tab
- `list-tab-titles.sh` - Lists all Yakuake tabs with their session IDs
- `switch-to-tab.sh` - Switches to a specific tab by session ID
- `switch-tab.sh` - Interactive fuzzy search to switch between tabs (requires fzf)

## Krusader Integration

```
cd %aPath% && yakuake-open-new-tab.sh $(basename %aPath%)
```

## Suggested Shell Aliases

```
alias rt='/path/to/yakuake-scripts/rename-current-tab.sh'
alias st='/path/to/yakuake-scripts/switch-tab.sh'
```

Replace `/path/to/yakuake-scripts/` with the actual path to your installation.
