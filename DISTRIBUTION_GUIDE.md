# Build & Distribution Guide

## 📦 Building IPAs for AltStore

### Step 1: Build RemindMe IPA

```bash
# Open Xcode project
open RemindMe.xcodeproj

# In Xcode:
# 1. Select RemindMe target
# 2. Set Signing & Capabilities with your Apple Developer Account
# 3. Product → Archive
# 4. Click "Distribute App"
# 5. Select "Direct Distribution"
# 6. Choose "Export" and save as RemindMe.ipa
```

### Step 2: Build Weather Dashboard IPA

```bash
# Open Xcode project (same process as above)
open WeatherDashboard.xcodeproj

# 1. Select WeatherDashboard target
# 2. Product → Archive
# 3. Distribute App → Direct Distribution → Export as WeatherDashboard.ipa
```

### Step 3: Upload to GitHub Releases

1. Go to: https://github.com/Ahmedatilla21-rgb/Altstore-app/releases/new
2. Create new release:
   - **Tag version**: `v1.0.0`
   - **Release title**: `RemindMe & Weather Dashboard v1.0.0`
   - **Description**: 
     ```
     Initial release featuring:
     - RemindMe: Beautiful reminder app with notifications
     - Weather Dashboard: Real-time weather with 5-day forecast
     ```
3. Upload both IPA files:
   - `RemindMe.ipa`
   - `WeatherDashboard.ipa`
4. Click "Publish release"

## 🌐 Adding Your Source to AltStore

### For Users to Add Your Source:

1. Open **AltStore** on their iOS device
2. Tap the **+** icon (Add Source)
3. Enter this URL:
   ```
   https://raw.githubusercontent.com/Ahmedatilla21-rgb/Altstore-app/main/source.json
   ```
4. Tap "Add"
5. Your apps will appear in the "Featured" section

### Alternative: Direct GitHub Release Method

Users can also directly install from GitHub releases:
1. Download the IPA from releases
2. Email it to their device
3. Open in AltStore

## 📝 Updating Apps

To update your apps:

1. Update version in `source.json`
2. Build new IPA files
3. Create new GitHub release with incremented version (v1.0.1, v1.1.0, etc.)
4. Upload IPAs
5. AltStore will automatically notify users of updates

## 🔗 Sharing Your Source

**Your AltStore Source URL:**
```
https://raw.githubusercontent.com/Ahmedatilla21-rgb/Altstore-app/main/source.json
```

Share this URL with others to let them add your source!

## ✅ Checklist

- [ ] Build RemindMe.ipa
- [ ] Build WeatherDashboard.ipa
- [ ] Create GitHub release v1.0.0
- [ ] Upload both IPA files
- [ ] Test adding source to AltStore
- [ ] Share source URL with users

## 🐛 Troubleshooting

**IPA won't build:**
- Check bundle identifier is unique
- Ensure signing certificate is valid
- Update Xcode to latest version

**Source won't add to AltStore:**
- Verify JSON syntax: https://jsonlint.com/
- Ensure all URLs are correct and accessible
- Check GitHub raw URL format

**Apps won't install:**
- Verify bundle identifiers match source.json
- Ensure device iOS version is 15.0+
- Check device has enough storage

