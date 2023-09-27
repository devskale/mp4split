# MP4Split

**MP4Split** is a lightweight and efficient shell script utility designed to split MP4 video files into smaller segments of a specified size, ensuring the integrity and synchronization of audio and video streams. Utilizing the power of FFmpeg, MP4Split automatically handles keyframe adjustments and segment numbering, providing a hassle-free solution for managing large video files.

## Problem Description
The initial use case for developing MP4Split was to facilitate the storage of video files larger than 4GB on FAT32 storage systems, which impose a file size limit. The script is designed with a focus on maintaining perfect audio and video synchronization, addressing common challenges encountered when splitting and storing large video files.

## Features
- **Segmentation**: Splits MP4 video files into smaller chunks based on user-defined size.
- **Synchronization**: Maintains audio-video synchronization and integrity through automatic keyframe adjustments.
- **Numbering**: Generates sequentially numbered segments, with an option to start numbering from any value.
- **Powered by FFmpeg**: Offers high compatibility and performance.

## Installation

1. **Clone the Repository**
    ```sh
    git clone https://github.com/username/MP4Split.git
    cd MP4Split
    ```

2. **Make the Script Executable**
    ```sh
    chmod +x mp4split.sh
    ```

## Usage
```sh
./mp4split.sh <input_video_file.mp4> <chunk_size_in_MB>
