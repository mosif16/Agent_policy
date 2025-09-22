# Apple macOS Human Interface Guidelines — 2025 Field Notes

## Liquid Glass on the desktop
- Mac sidebars and navigation chrome are rebuilt with Liquid Glass so pro apps keep the macOS structure users rely on while visually matching iPad and visionOS.
- Vibrancy now recedes more subtly: secondary sidebars and tinted controls pick up ambient color instead of overpowering content.
- Preserve pro affordances like persistent menu bars and inspectors even as surfaces gain layered reflections, reinforcing macOS familiarity for long-time users.
- Respect Reduce Transparency and Increase Contrast settings so glass stays legible and doesn't mask dense productivity layouts.

## Core design principles
- Keep clarity front and center: emphasize primary documents and tools while using negative space and typography to support pro workflows.
- Reinforce structure with consistent window organization, sidebar placement, and toolbar groupings so people can predict where tasks live across apps.
- Use depth to communicate layering—shadows, scaling, and translucency should clarify focus without obscuring persistent pro controls.

## Navigation & multitasking
- Safari for macOS adopts the same Compact, Bottom, and Top layout options introduced on iOS, collapsing the address field as you scroll.
- The new design resources package ships Mac-specific components (tab bars, sidebars, keyboards) tuned for the glass effect, reducing custom asset work for Catalyst and AppKit teams.
- Keep keyboard shortcuts and menu bar entries visible when toolbars compress so pro workflows don't lose discoverability.

## Iconography & widgets
- Icon Composer supports Mac targets, letting teams preview layered app icons and widget glyphs with accurate Liquid Glass reflections across environments.
- Clear icon styles remain opt-in so Mac users can stay with opaque pictograms during the transition.
- Validate symbol contrast for clear icon variants against common light, dark, and dynamic wallpapers to keep glyphs legible.

## Visual language & typography
- Rely on San Francisco text and display faces to align with system typography; adjust optical sizes for large monitors and ensure responsive line lengths at pro window widths.
- Use color sparingly—system accents, semantic colors, and vibrancy tokens should communicate status without interfering with dense content panes.
- Apply focus effects and separators to direct attention when multiple windows stack, keeping the active window distinct without heavy borders.

## Motion & feedback
- Animate transitions along the macOS spatial model: slide source lists, fade toolbars, and preserve momentum when windows resize or adapt to new layouts.
- Pair subtle haptics (on supported trackpads) and sound cues with motion so feedback reinforces state changes without startling in quiet workspaces.
- Replace large parallax with crossfades when Reduce Motion is enabled, and ensure essential focus cues remain available through opacity and scale changes.

## Desktop personalization
- Provide a simple control to switch between clear and classic icon sets and communicate how Dock, menu bar, and widgets adapt.

## Accessibility & inclusive design
- Validate experiences with VoiceOver, Full Keyboard Access, and Switch Control so pointer-heavy workflows remain navigable from the keyboard or assistive devices.
- Honor Bold Text, Increase Contrast, and Reduce Transparency, confirming custom controls respond with the same polish as system components.
- Support color filters and customizable text sizes in multi-column layouts, ensuring dense tables and inspectors remain legible when people adjust scaling.

## Implementation checklist
- Update sidebars, inspectors, and toolbars to the glass material set in the 2025 design resources bundle; remove legacy custom blurs.
- Test multiple Safari layout options and ensure key commands stay exposed in menus when toolbars collapse.
- Re-export Mac and widget icons through Icon Composer to produce light, dark, clear, and tinted variants consistent with the new material.
- Validate accessibility toggles (Reduce Transparency, Increase Contrast) with the refreshed surfaces to guarantee legibility for all users.
- Share the updated SwiftUI and AppKit component references so engineering teams can align with the system glass stack instead of rolling custom composites.
