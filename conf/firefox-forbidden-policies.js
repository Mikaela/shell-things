//
// Remember to start writing at line 2. This is my second attempt at Firefox
// autoconfig after being taught by LibreAwoo, but this time I am trying to
// avoid duplicating my browser policy, which you can find from the same
// repository, etc/firefox/policies/policies.json

// If autoconfig is not found, fallback. Also means this file.
pref("autoadmin.failover_to_cached", true);
pref(
	"autoadmin.global_config_url",
	"https://gitea.blesmrt.net/mikaela/shell-things/raw/branch/master/conf/firefox-forbidden-policies.js",
);
pref("autoadmin.offline_failover", true);
pref("autoadmin.refresh_interval", 120);

// Automatically click cookiebanners although uBlock Origin might block them
pref("cookiebanners.bannerClicking.enabled", true);
pref("cookiebanners.service.mode", 2);
pref("cookiebanners.service.mode.privateBrowsing", 2);

// I can set my preferred fonts in an order! :O
// but obviously this is forbidden in policies.json!
pref("font.name-list.monospace.x-cyrillic", "Noto Shanns Mono, monospace");
pref("font.name-list.monospace.x-western", "Noto Shanns Mono, monospace");
pref("font.name-list.sans-serif.x-cyrillic", "Noto Sans, sans-serif");
pref("font.name-list.sans-serif.x-western", "Noto Sans, sans-serif");
pref("font.name-list.serif.x-cyrillic", "Noto Serif, serif");
pref("font.name-list.serif.x-western", "Noto Serif, serif");

// Play animated images only once, accessibility.
pref("image.animation.mode", "once");

// Spoof en-US as language to scripts
pref("javascript.use_us_english_locale", true);

// DNT although PrivacyBadger from policy handles this
pref("privacy.donottrackheader.enabled", true);
pref("privacy.donottrackheader.value", 1);

// More tunable privacy.resistfingerprinting. I have lost the privacy game
// many times before this point, so this is nothing.
//pref("privacy.fingerprintingProtection", true);

// Somehow I cannot clearPref this, so...
//clearPref("privacy.fingerprintingProtection");
lockPref("privacy.fingerprintingProtection", false);

//pref(
//	"privacy.fingerprintingProtection.overrides",
//	"+AllTargets,-KeyboardEvents,-SpeechSynthesis,-CSSPrefersColorScheme,-CSSPrefersReducedMotion,-NavigatorPlatform,-NavigatorUserAgent,-JSDateTimeUTC,-HttpUserAgent,-FontVisibilityRestrictGenerics,-FontVisibilityBaseSystem,-FontVisibilityLangPack",
//);
clearPref("privacy.fingerprintingProtection.overrides");
//pref("privacy.fingerprintingProtection.pbmode", true);
clearPref("privacy.fingerprintingProtection.pbmode");
// (Incompatible with the above)
//pref("privacy.resistFingerprinting", false);
clearPref("privacy.resistFingerprinting");
//pref("privacy.resistFingerprinting.block_mozAddonManage", true);
clearPref("privacy.resistFingerprinting.block_mozAddonManage");
// Letterboxing from Tor Browser, I like it in general.
lockPref("privacy.resistFingerprinting.letterboxing", true);
// Still Incompatible with the above
//pref("privacy.resistFingerprinting.pbmode", false);
clearPref("privacy.resistFingerprinting.pbmode");

// Enable containers without extensions (although those are forced by the
// policy. TODO: Remove these as they are in the policy, but disallowed by
// current ESR
pref("privacy.userContext.enabled", true);
pref("privacy.userContext.ui.enabled", true);

// Enables reading mode for all pages (at least in theory)
pref("reader.parse-on-load.force-enabled", true);

// Ensure OCSP stapling is enabled, especially if the server has it
pref("security.ssl.enable_ocsp_must_staple", true);

// TODO: Consider removing this when ESR updates as only it needs this for
// ECH, which is otherwise the default=
pref("security.tls.ech.grease_http3", true);

// No making configuration on the last line of the file!
//
