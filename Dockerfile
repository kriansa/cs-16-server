FROM kriansa/cs-16:latest

# Create subfolders so we can mount on them
RUN mkdir -p cstrike/addons cstrike/cfgs cstrike_downloads/maps
