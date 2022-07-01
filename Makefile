# The guix binary
# The location of the Scheme files
SCHEMEDIR=./guix
# Our channels
OUR_CHANNELS=$(SCHEMEDIR)/base-channels.scm
# The file we want to dump the channels into
TARGET_CHANNEL=$(SCHEMEDIR)/channels.scm
channels:
	@guix time-machine -C "$(OUR_CHANNELS)" -- describe -f channels > $(TARGET_CHANNEL)

# Local Variables:
# indent-tabs-mode: t
# End:
