#!/bin/bash

# Check for correct number of arguments
if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <video file> <chunk size in MB>"
    exit 1
fi

# Video file and chunk size in MB
VIDEO_FILE=$1
CHUNK_SIZE_MB=$2

# Check if the video file exists
if [[ ! -f $VIDEO_FILE ]]; then
    echo "Error: $VIDEO_FILE does not exist."
    exit 1
fi

# Use ffprobe to get the bit rate in bits per second
BIT_RATE=$(ffprobe -v error -show_entries format=bit_rate -of default=noprint_wrappers=1:nokey=1 "$VIDEO_FILE")

# Calculate chunk length in seconds
CHUNK_LENGTH=$(echo "scale=2; ($CHUNK_SIZE_MB * 8 * 10^6) / $BIT_RATE" | bc)

# Split the video with the segment muxer
ffmpeg -i "$VIDEO_FILE" -c copy -map 0 -segment_time $CHUNK_LENGTH -f segment -reset_timestamps 1 -avoid_negative_ts make_zero "${VIDEO_FILE%.mp4}_part%03d.mp4"

echo "Splitting done."
