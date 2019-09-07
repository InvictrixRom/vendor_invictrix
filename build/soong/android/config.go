package android

// Global config used by Lineage soong additions
var InvictrixConfig = struct {
	// List of packages that are permitted
	// for java source overlays.
	JavaSourceOverlayModuleWhitelist []string
}{
	// JavaSourceOverlayModuleWhitelist
	[]string{
		"org.invictrix.hardware",
	},
}
