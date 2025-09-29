#!/bin/bash

# Convert SVG backgrounds to PNG format
# Requires inkscape to be installed

echo "Converting Tron: ARES style backgrounds..."

# Convert SVG files to PNG
if command -v inkscape &> /dev/null; then
    echo "Using Inkscape to convert SVG files..."
    
    # Convert grid background
    inkscape --export-type=png --export-filename="backgrounds/1-tron-ares-grid.png" --export-width=1920 --export-height=1080 "backgrounds/1-tron-ares-grid.svg"
    
    # Convert circuits background  
    inkscape --export-type=png --export-filename="backgrounds/2-tron-ares-circuits.png" --export-width=1920 --export-height=1080 "backgrounds/2-tron-ares-circuits.svg"
    
    # Convert digital background
    inkscape --export-type=png --export-filename="backgrounds/3-tron-ares-digital.png" --export-width=1920 --export-height=1080 "backgrounds/3-tron-ares-digital.svg"
    
    echo "Background conversion completed!"
    
elif command -v rsvg-convert &> /dev/null; then
    echo "Using rsvg-convert to convert SVG files..."
    
    # Convert grid background
    rsvg-convert -w 1920 -h 1080 -o "backgrounds/1-tron-ares-grid.png" "backgrounds/1-tron-ares-grid.svg"
    
    # Convert circuits background
    rsvg-convert -w 1920 -h 1080 -o "backgrounds/2-tron-ares-circuits.png" "backgrounds/2-tron-ares-circuits.svg"
    
    # Convert digital background
    rsvg-convert -w 1920 -h 1080 -o "backgrounds/3-tron-ares-digital.png" "backgrounds/3-tron-ares-digital.svg"
    
    echo "Background conversion completed!"
    
else
    echo "Error: Neither inkscape nor rsvg-convert found."
    echo "Please install one of these tools to convert SVG to PNG:"
    echo "  - inkscape (recommended)"
    echo "  - librsvg2-bin (for rsvg-convert)"
    echo ""
    echo "You can manually convert the SVG files using any SVG to PNG converter."
    exit 1
fi

# Remove old backgrounds
echo "Removing old background files..."
rm -f backgrounds/1-catppuccin.png
rm -f backgrounds/2-cat-waves-mocha.png  
rm -f backgrounds/3-cat-blue-eye-mocha.png

# Clean up SVG files (optional)
echo "Cleaning up temporary SVG files..."
rm -f backgrounds/*.svg

echo "Tron: ARES backgrounds are ready!"
echo "New backgrounds:"
echo "  - 1-tron-ares-grid.png (Grid pattern with glowing center)"
echo "  - 2-tron-ares-circuits.png (Circuit board design)"
echo "  - 3-tron-ares-digital.png (Digital matrix effect)"
