#!/usr/bin/env python3

import os
import subprocess
import tempfile
from PIL import Image, ImageFilter

def take_screenshot(path):
    subprocess.run(['scrot', path], check=True)

def blur_image(input_path, output_path, radius=10, scale=0.2):
    with Image.open(input_path) as img:
        small = img.resize(
            (int(img.width * scale), int(img.height * scale)),
            resample=Image.BILINEAR
        )
        blurred = small.filter(ImageFilter.GaussianBlur(radius))
        result = blurred.resize(img.size, Image.BILINEAR)
        result.save(output_path)


def lock_with_i3lock(image_path):
    subprocess.run([
        'i3lock',
        '-i', image_path,
        '--nofork'  # Optional: wait until unlock before exiting
    ])

def main():
    with tempfile.TemporaryDirectory() as tmpdir:
        screenshot = os.path.join(tmpdir, 'screenshot.png')
        blurred = os.path.join(tmpdir, 'blurred.png')

        take_screenshot(screenshot)
        blur_image(screenshot, blurred)
        lock_with_i3lock(blurred)

if __name__ == '__main__':
    main()
