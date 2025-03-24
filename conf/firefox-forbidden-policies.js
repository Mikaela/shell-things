//
// Remember to start writing at line 2. This is my second attempt at Firefox
// autoconfig after being taught by LibreAwoo, but this time I am trying to
// avoid duplicating my browser policy, which you can find from the same
// repository, etc/firefox/policies/policies.json

// If autoconfig is not found, fallback. Also means this file.
lockPref("autoadmin.failover_to_cached", true);
lockPref(
	"autoadmin.global_config_url",
	"https://codeberg.org/Aminda/shell-things/raw/branch/cxefa/conf/firefox-forbidden-policies.js",
);
lockPref("autoadmin.offline_failover", true);
lockPref("autoadmin.refresh_interval", 120);

// Automatically click cookiebanners although uBlock Origin might block them
lockPref("cookiebanners.bannerClicking.enabled", true);
lockPref("cookiebanners.service.mode", 2);
lockPref("cookiebanners.service.mode.privateBrowsing", 2);

// I can set my preferred fonts in an order! :O
// but obviously this is forbidden in policies.json!
lockPref(
	"font.name-list.monospace.x-cyrillic",
	"Comic Shanns Mono, Roboto Mono, Liberation Mono, Noto Sans Mono, monospace",
);
lockPref(
	"font.name-list.monospace.x-western",
	"Comic Shanns Mono, Roboto Mono, Liberation Mono, Noto Sans Mono, monospace",
);
// REMEMBER! OpenDyslexic won't work here for some reason, use the extension
// once it returns to Firefox! https://github.com/OpenDyslexic/extension/issues/75
lockPref(
	"font.name-list.sans-serif.x-cyrillic",
	"Inclusive Sans, Roboto, Liberation Sans, Noto Sans, sans-serif",
);
lockPref(
	"font.name-list.sans-serif.x-western",
	"Inclusive Sans, Liberation Sans, Comic Neue, Roboto, Noto Sans, sans-serif",
);
lockPref(
	"font.name-list.serif.x-cyrillic",
	"Inclusive Sans, Liberation Serif, Roboto Serif, Noto Serif, serif",
);
lockPref(
	"font.name-list.serif.x-western",
	"Inclusive Sans, Liberation Serif, Roboto Serif, Noto Serif, serif",
);
// clearPref("font.name-list.monospace.x-cyrillic");
// clearPref("font.name-list.monospace.x-western");
// clearPref("font.name-list.sans-serif.x-cyrillic");
// clearPref("font.name-list.sans-serif.x-western");
// clearPref("font.name-list.serif.x-cyrillic");
// clearPref("font.name-list.serif.x-western");

// Play animated images only once, accessibility.
lockPref("image.animation_mode", "once");

// Spoof en-US as language to scripts
lockPref("javascript.use_us_english_locale", true);

// More tunable privacy.resistfingerprinting.
// Refer to https://searchfox.org/mozilla-central/source/toolkit/components/resistfingerprinting/RFPTargets.inc
lockPref("privacy.fingerprintingProtection", true);
lockPref("privacy.fingerprintingProtection.pbmode", true);
lockPref(
	"privacy.fingerprintingProtection.overrides",
	"+AllTargets,-KeyboardEvents,-CSSPrefersColorScheme,-CSSPrefersReducedMotion,-JSDateTimeUTC,-FontVisibilityBaseSystem,-FontVisibilityRestrictGenerics",
);
lockPref("browser.display.use_document_fonts", 0);

// Letterboxing from Tor Browser, I like it in general.
lockPref("privacy.resistFingerprinting.letterboxing", true);

// Enables reading mode for all pages (at least in theory)
lockPref("reader.parse-on-load.force-enabled", true);

// Ensure OCSP stapling is enabled, especially if the server has it
lockPref("security.ssl.enable_ocsp_must_staple", true);

// Distributed Aggregation Protocol for Privacy Preserving Measurement
// https://github.com/ietf-wg-ppm/draft-ietf-ppm-dap
// This should be better for privacy with telemetry enabled.
lockPref("toolkit.telemetry.dap_enabled", true);

// New sidebar
lockPref("sidebar.revamp", true);
lockPref("sidebar.verticalTabs", true);
lockPref("sidebar.visibility", "always-show");

// Per process isolation
lockPref("fission.autostart", true);

// No making configuration on the last line of the file!
//
