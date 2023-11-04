// LibreWolf override configuration, begins with samples from
// https://librewolf.net/docs/settings/
// Also incorporates some of https://aminda.eu/browser-extensions#firefox-aboutconfig

// Enable letterboxing
defaultPref("privacy.resistFingerprinting.letterboxing", true);

// Stricter cross-origin policy
defaultPref("network.http.referer.XOriginPolicy", 2);

// Enable WebGL
//defaultPref("webgl.disabled", false);

// Enable Firefox accounts
defaultPref("identity.fxaccounts.enabled", true);

// Settings on what to clear on quit
// - Goal: let Element Web & co stay logged in
defaultPref("privacy.clearOnShutdown.cache", false);
defaultPref("privacy.clearOnShutdown.cookies", false);
//defaultPref("privacy.clearOnShutdown.downloads", false);
//defaultPref("privacy.clearOnShutdown.formdata", false);
defaultPref("privacy.clearOnShutdown.history", false);
defaultPref("privacy.clearOnShutdown.offlineApps", false);
defaultPref("privacy.clearOnShutdown.openWindows", false);
defaultPref("privacy.clearOnShutdown.sessions", false);
defaultPref("privacy.clearOnShutdown.siteSettings", false);

// Don't resume from crash (SSD)
defaultPref("browser.sessionstore.resume_from_crash", false);

// Stricter autoplay
defaultPref("media.autoplay.blocking_policy", 2);

// No corporate CA MITM
defaultPref("security.certerrors.mitm.auto_enable_enterprise_roots", false);

// Decrease animations
defaultPref("image.animation_mode", "once");

// Punycode
defaultPref("network.IDN_show_punycode", true);

// Enforce reader mode enabling?
defaultPref("reader.parse-on-load.force-enabled", true);

// TRR & ECH
defaultPref("network.trr.mode", 3);
defaultPref("network.trr.early-AAAA", true);
defaultPref("network.trr.uri", "https://dns11.quad9.net/dns-query");
defaultPref("network.trr.disable-ECS", false);
defaultPref("network.dns.echconfig.enabled", true);
defaultPref("network.dns.use_https_rr_as_altsvc", true);
defaultPref(
	"network.trr.excluded-domains",
	"http.badssl.com,norwegianwifi.com",
);

// Default UI scale
defaultPref("layout.css.devPixelsPerPx", "1.5");
