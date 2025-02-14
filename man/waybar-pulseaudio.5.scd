waybar-pulseaudio(5)

# NAME

waybar - pulseaudio module

# DESCRIPTION

The *pulseaudio* module displays the current volume reported by PulseAudio.

Additionally, you can control the volume by scrolling *up* or *down* while the cursor is over the module.

# CONFIGURATION

*format*: ++
	typeof: string  ++
	default: {volume}% ++
	The format, how information should be displayed. This format is used when other formats aren't specified.

*format-bluetooth*: ++
	typeof: string ++
	This format is used when using bluetooth speakers.

*format-muted*: ++
	typeof: string ++
	This format is used when the sound is muted.

*format-source*: ++
	typeof: string ++
	default: {volume}% ++
	This format used for the source.

*format-source-muted*: ++
	typeof: string ++
	This format is used when the source is muted.

*format-icons*: ++
	typeof: array ++
	Based on the current port name and volume, the corresponding icon gets selected. The order is *low* to *high*. See *Icons*.

*rotate*: ++
	typeof: integer ++
	Positive value to rotate the text label.

*states*: ++
	typeof: object ++
	A number of volume states which get activated on certain volume levels. See *waybar-states(5)*.

*max-length*: ++
	typeof: integer ++
	The maximum length in character the module should display.

*min-length*: ++
	typeof: integer ++
	The minimum length in characters the module should accept.

*align*: ++
	typeof: float ++
	The alignment of the text, where 0 is left-aligned and 1 is right-aligned. If the module is rotated, it will follow the flow of the text.

*scroll-step*: ++
	typeof: float ++
	default: 1.0 ++
	The speed at which to change the volume when scrolling.

*on-click*: ++
	typeof: string ++
	Command to execute when clicked on the module.

*on-click-middle*: ++
	typeof: string ++
	Command to execute when middle-clicked on the module using mousewheel.

*on-click-right*: ++
	typeof: string ++
	Command to execute when you right-click on the module.

*on-update*: ++
	typeof: string ++
	Command to execute when the module is updated.

*on-scroll-up*: ++
	typeof: string ++
	Command to execute when scrolling up on the module. This replaces the default behaviour of volume control.

*on-scroll-down*: ++
	typeof: string ++
	Command to execute when scrolling down on the module. This replaces the default behaviour of volume control.

*smooth-scrolling-threshold*: ++
	typeof: double ++
	Threshold to be used when scrolling.

*reverse-scrolling*: ++
	typeof: bool ++
	Option to reverse the scroll direction.

*tooltip*: ++
	typeof: bool ++
	default: true ++
	Option to disable tooltip on hover.

*max-volume*: ++
	typeof: integer ++
	default: 100 ++
	The maximum volume that can be set, in percentage.

*ignored-sinks*: ++
	typeof: array ++
	Sinks in this list will not be shown as active sink by Waybar. Entries should be the sink's description field.

# FORMAT REPLACEMENTS

*{desc}*: Pulseaudio port's description, for bluetooth it'll be the device name.

*{volume}*: Volume in percentage.

*{icon}*: Icon, as defined in *format-icons*.

*{format_source}*: Source format, *format-source*, *format-source-muted*.

# ICONS:

The following strings for *format-icons* are supported.

- the device name

If they are found in the current PulseAudio port name, the corresponding icons will be selected.

- *default* (Shown, when no other port is found)
- *headphone*
- *speaker*
- *hdmi*
- *headset*
- *hands-free*
- *portable*
- *car*
- *hifi*
- *phone*


# EXAMPLES

```
"pulseaudio": {
	"format": "{volume}% {icon}",
	"format-bluetooth": "{volume}% {icon}",
	"format-muted": "",
	"format-icons": {
		"alsa_output.pci-0000_00_1f.3.analog-stereo": "",
		"headphones": "",
		"handsfree": "",
		"headset": "",
		"phone": "",
		"portable": "",
		"car": "",
		"default": ["", ""]
	},
	"scroll-step": 1,
	"on-click": "pavucontrol"
}
```

# STYLE

- *#pulseaudio*
- *#pulseaudio.bluetooth*
- *#pulseaudio.muted*
