# Genomics helper functions

def track_definition(tracktype, tlabel, clabel, color, hex=False):
    """Make a UCSC-like track definition line.
    """
    track = "track type={} name={} description={} color={}"
    if hex:
        rgb = "{},{},{}"
        color = rgb.format(
            *tuple(int(color.lstrip("#")[i:i+2], 16) for i in (0, 2, 4))
        )
    return track.format(tracktype, tlabel, clabel, color)
