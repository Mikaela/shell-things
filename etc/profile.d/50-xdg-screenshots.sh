# OK, so this could be a lot more pretty, but it works for ensuring users have
# a screenshot directory (even if I still don't know does anything else than
# grimshot care about that).

# root is neither taking screenshots nor using gui
if [[ "$(id -u)" != "0" ]]; then
	# if the configuration file exists, that is good enough indication for me
	# that the tools are supported.
	if [[ -f "$(xdg-user-dir)/.config/user-dirs.locale)" ]]; then
		# If the output differs, the path is set and there is no need to
		# continue.
		if [[ $(xdg-user-dir SCREENSHOTS) != $(xdg-user-dir) ]]; then
			# If we are continuing anyway, ensure existence of locale file and see if it's something I support.
			touch "$(cat $(xdg-user-dir)/.config/user-dirs.locale)"
			XDGLOCALE="$(cat $(xdg-user-dir)/.config/user-dirs.locale)"
			if [[ "$XDGLOCALE" == "fi" || "$XDGLOCALE" == "fi_FI" ]]; then
				# I would say Kuvankaappaukset, but for some reason KDE Plasma says Kuvakaappaukset, and I don't care enough.
				xdg-user-dirs-update --set SCREENSHOTS $(xdg-user-dir PICTURES)/Kuvakaappaukset
			else
				# Generic English fallack, like I think upstream does.
				xdg-user-dirs-update --set SCREENSHOTS $(xdg-user-dir PICTURES)/Screenshots
			fi
			# Ensure the directory exists.
			mkdir -p "$(xdg-user-dir SCREENSHOTS)"
		fi
	fi
fi
