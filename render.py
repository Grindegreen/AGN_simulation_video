import argparse
import bpy
import os

parser = argparse.ArgumentParser()
parser.add_argument(
    "--output-dir",
    type=str,
    required=True,
    help="Output directory for the rendered animation",
)
parser.add_argument(
    "--render-file",
    type=str,
    required=True,
    help="Path to the Blender file to render",
)

args = parser.parse_args()

# Set the output directory
output_directory = args.output_dir
if not os.path.exists(output_directory):
    os.makedirs(output_directory)
bpy.context.scene.render.filepath = output_directory

print("Loading the render file...")
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.wm.open_mainfile(filepath=args.render_file)

# Get scene
scene = bpy.context.scene

print("Render settings:")
print(f"Resolution: {scene.render.resolution_x}x{scene.render.resolution_y}")
print(f"Frames: {scene.frame_start}-{scene.frame_end}")
print(f"Output: {scene.render.filepath}")

# Start rendering
print("Starting render...")
bpy.ops.render.render(animation=True)
print("Render complete!")
