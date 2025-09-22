# Apple iOS Human Interface Guidelines — 2025 Field Notes

## Liquid Glass essentials
- Liquid Glass is the new cross-platform material; it refracts surrounding content, dynamically adapts to light and dark modes, and separates navigation surfaces from content while staying familiar to long-time users.
- Controls, tab bars, and sidebars now float above content with concentric corner treatments that mirror modern hardware curves.
- The material layers specular highlights and edge reflections so surfaces feel responsive while maintaining focus on primary content across iOS, macOS, and visionOS.
- Adjust blur depth and brightness based on ambient context and accessibility toggles like Reduce Transparency so translucency never compromises readability.

## Core design principles
- Lead with clarity: keep primary content dominant, rely on ample negative space, and state intent with succinct language so interfaces stay approachable on any display size.
- Maintain consistency across screens by reusing familiar patterns, hierarchy, and placement to reinforce muscle memory as users move between compact, regular, and Stage Manager contexts.
- Support depth thoughtfully; use lighting, scale, and parallax to communicate hierarchy while preserving predictable back navigation and safe-areas.

## Navigation & layout
- Tab bars shrink while you scroll, then expand when you return to the top, keeping navigation in reach without covering content.
- Safari offers Compact, Bottom, and Top layouts; in all modes the URL bar collapses to a slim pill as you scroll so pages stay front and center.
- Updated design resources include Sketch/Photoshop templates for Liquid Glass navigation bars, keyboards, and system surfaces to speed adoption.
- Use pinned controls and floating tab bars to keep primary actions visible as layouts compress during scroll or when users switch between bottom and top navigation modes.

## Visual system & icons
- Icon Composer lets teams build layered iOS icons with light, dark, clear, and tinted variants to match Liquid Glass highlights.
- Widgets, Lock Screen elements, and tab bars inherit the same material, delivering a cohesive sheen across Home Screen, Control Center, and core apps.
- Users can opt into clear icon styles; the default remains the familiar opaque set to ease transition.
- Lock Screen shortcuts and Control Center tiles pick up wallpaper tint in the clear mode, so confirm symbols and text maintain contrast under varied backgrounds.
- Align widget glass treatments with Home Screen icon choices so users see a single visual rhythm whether they pick clear or opaque sets.

## Visual language & typography
- Set typography with the San Francisco family and its optical sizes, letting Dynamic Type drive text scaling and ensuring responsive line heights across compact and regular classes.
- Pair color with purpose: reserve saturated hues for emphasis, extend system accent colors for affordances, and ensure text meets contrast ratios as wallpapers and materials shift.
- Highlight focus with blur, tint, and depth cues that guide attention to primary actions without overwhelming immersive content.

## Motion & feedback
- Use motion to reinforce spatial relationships—animate transitions along the axis users navigate and keep durations consistent with system patterns.
- Layer haptics and sound cues sparingly so feedback complements visual motion and remains respectful of quiet environments.
- Honor Reduce Motion by substituting fades or scaling with crossfades and ensuring essential state changes remain explicit without large movements.

## Personalization & lock screen
- Document how the Home Screen adapts when people opt into the clear icon set so onboarding flows explain what will change.
- Surface the toggle to return to classic icons so users can experiment without losing familiar affordances.

## Accessibility & inclusive design
- Treat Dynamic Type, VoiceOver, and Bold Text as first-class: audit custom controls and liquid surfaces at large text sizes to avoid truncation.
- Provide accessible alternatives when transparency, motion, or depth are reduced so content and critical actions remain clear.
- Test interactions with AssistiveTouch, Switch Control, and Voice Control to confirm gestures and focus orders remain intuitive with floating navigation.

## Developer checklist
- Refresh navigation bars, tab bars, and toolbars using the new Liquid Glass materials from the 2025 design resource drop.
- Preview layered icons in Icon Composer to validate specular highlights and tinted appearances.
- Offer layout choices (Compact/Bottom/Top) in Safari-like experiences so people can pick their preferred navigation pattern.
- Document accessibility toggles (e.g., Reduce Transparency) when leveraging heavy glass effects to support users sensitive to motion or blur.
- Audit Dynamic Type, high contrast, and motion settings through the new glass surfaces; provide fallbacks when translucency or vibrancy is disabled.
- Link to updated SwiftUI, UIKit, and design kit resources so engineers and designers can adopt Liquid Glass components without rebuilding primitives.
