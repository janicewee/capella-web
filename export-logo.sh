#!/bin/bash
# Export logo to PNG using headless Chrome (if installed)

INPUT_FILE="$(pwd)/logo-250x250.html"
OUTPUT_FILE="$(pwd)/capella-web-logo-250x250.png"

echo "Exporting CAPELLA WEB logo..."

# Method 1: Using wkhtmltoimage (if installed)
if command -v wkhtmltoimage &> /dev/null; then
    wkhtmltoimage --width 250 --height 250 --enable-local-file-access "$INPUT_FILE" "$OUTPUT_FILE"
    echo "Logo exported to: $OUTPUT_FILE"
    exit 0
fi

# Method 2: Using Chrome/Chromium headless
if command -v /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome &> /dev/null; then
    /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
        --headless \
        --screenshot="$OUTPUT_FILE" \
        --window-size=250,250 \
        --hide-scrollbars \
        "$INPUT_FILE"
    echo "Logo exported to: $OUTPUT_FILE"
    exit 0
fi

# Method 3: Manual instructions
echo ""
echo "=== MANUAL METHOD ==="
echo "1. Open logo-250x250.html in Safari"
echo "2. Cmd+Shift+4 (no spacebar - use crosshair)"
echo "3. Drag to select just the blue logo box"
echo "4. Release to capture"
echo "5. Screenshot saves to Desktop as PNG 250x250"
echo ""
echo "Tips:"
echo "- The logo is designed at exactly 250x250"
echo "- Drag from top-left corner of blue to bottom-right"
echo "- Check preview shows 250x250 in bottom-right of selection"
