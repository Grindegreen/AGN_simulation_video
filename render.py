import bpy
import os

# Set the output directory
output_directory = os.getcwd()
bpy.context.scene.render.filepath = output_directory

print("Loading AGN_video.blend...")
bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.wm.open_mainfile(filepath="AGN_simulation.blend")

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
