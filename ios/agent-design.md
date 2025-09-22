<agentDesignGuide version="1.0" updated="2025-09-20">
  <purpose>Field-ready directives distilled from iOS and macOS 2025 HIG notes for Liquid Glass, navigation, visual language, motion, personalization, and accessibility.</purpose>
  <sharedPractices>
    <principles>
      <directive id="clarity">Lead with clarity: foreground primary content, use succinct copy, and reinforce predictable hierarchy.</directive>
      <directive id="consistency">Reuse familiar patterns, placements, and component behaviors when adapting layouts across devices and contexts.</directive>
      <directive id="depth">Apply depth cues (lighting, scale, translucency) to signal hierarchy while keeping navigation and safe areas reliable.</directive>
    </principles>
    <visualLanguage>
      <directive id="typography">Adopt the San Francisco family with appropriate optical sizes; honor Dynamic Type and responsive line lengths.</directive>
      <directive id="color">Reserve saturated color for emphasis, extend system accent and semantic palettes, and meet contrast ratios as materials shift.</directive>
      <directive id="focus">Use blur, tint, separators, and focus states to direct attention without overpowering content or dense workflows.</directive>
    </visualLanguage>
    <motionFeedback>
      <directive id="spatial">Animate along the user’s navigation axis or platform spatial model; keep durations consistent with system patterns.</directive>
      <directive id="feedback">Layer haptics and sound sparingly so feedback complements visual motion and respects quiet environments.</directive>
      <directive id="reduceMotion">Provide crossfades or minimal transitions when Reduce Motion is enabled while keeping state changes explicit.</directive>
    </motionFeedback>
    <accessibility>
      <directive id="coreAPIs">Treat Dynamic Type, VoiceOver, Bold Text, Reduce Transparency, Increase Contrast, and Reduce Motion as primary constraints.</directive>
      <directive id="assistive">Validate AssistiveTouch, Switch Control, Voice Control, VoiceOver, and Full Keyboard Access flows for custom or floating controls.</directive>
      <directive id="fallbacks">Offer clear alternatives when translucency, motion, or color filters adjust the UI so critical tasks remain legible.</directive>
    </accessibility>
  </sharedPractices>
  <platforms>
    <platform name="iOS">
      <materials>
        <note id="liquidGlass">Adopt Liquid Glass for navigation bars, tab bars, sidebars, widgets, and Lock Screen elements; tune blur depth and brightness for ambient context.</note>
        <note id="floatingControls">Keep primary actions in reach with floating or pinned controls that adapt as users scroll or toggle bottom/top navigation modes.</note>
      </materials>
      <visualSystem>
        <note id="iconComposer">Use Icon Composer to export layered icons in light, dark, clear, and tinted variants; ensure Control Center and widget treatments stay consistent.</note>
        <note id="clearIcons">Explain the clear icon toggle, document Home Screen effects, and provide a quick path back to classic icons.</note>
      </visualSystem>
      <motion>
        <note id="transitions">Align transitions with navigation direction, applying parallax thoughtfully across compact, regular, and Stage Manager environments.</note>
        <note id="haptics">Pair subtle haptics with key state changes and verify intensity across device families.</note>
      </motion>
      <personalization>
        <note id="presets">Offer presets that coordinate wallpapers, icon treatments, and widget stacks to showcase Liquid Glass without heavy setup.</note>
      </personalization>
      <accessibility>
        <note id="dynamicType">Audit layouts at large Dynamic Type sizes to prevent truncation in glass-heavy areas.</note>
        <note id="assistiveFlows">Test AssistiveTouch, Switch Control, and Voice Control paths to ensure floating navigation remains discoverable.</note>
      </accessibility>
      <implementationChecklist>
        <item>Refresh navigation bars, toolbars, and tab bars with 2025 Liquid Glass components from Apple’s resource bundle.</item>
        <item>Provide Compact/Bottom/Top layout choices for Safari-like experiences and keep critical actions reachable.</item>
        <item>Document how Reduce Transparency, Reduce Motion, and other toggles alter presented surfaces.</item>
        <item>Link engineers to updated SwiftUI and UIKit component references for glass-compatible primitives.</item>
      </implementationChecklist>
    </platform>
    <platform name="macOS">
      <materials>
        <note id="desktopGlass">Rebuild sidebars, inspectors, and navigation chrome with Liquid Glass while preserving persistent menu bars and pro affordances.</note>
        <note id="vibrancyControl">Let secondary sidebars inherit ambient color without overpowering core content, respecting transparency and contrast settings.</note>
      </materials>
      <navigation>
        <note id="safariLayouts">Support Compact, Bottom, and Top Safari toolbar layouts; ensure commands stay exposed when toolbars collapse.</note>
        <note id="stageManager">Align Stage Manager surfaces and floating toolbars with the system material stack so tiled windows feel cohesive.</note>
      </navigation>
      <visualSystem>
        <note id="sfTypography">Use San Francisco text/display faces tuned for large monitors; maintain readable line lengths in wide window layouts.</note>
        <note id="focusStates">Apply separators, shadows, and focus rings to distinguish active windows without heavy borders.</note>
      </visualSystem>
      <motion>
        <note id="spatialModel">Animate source lists and toolbars along the macOS spatial model and preserve momentum when resizing windows or switching contexts.</note>
        <note id="quietFeedback">Match subtle haptics and sounds with motion to reinforce state changes in professional environments.</note>
      </motion>
      <accessibility>
        <note id="keyboardAccess">Verify VoiceOver, Full Keyboard Access, and Switch Control flows for pointer-centric UI.</note>
        <note id="contrastControls">Honor Bold Text, Increase Contrast, Reduce Transparency, and color filter adjustments across dense inspectors.</note>
      </accessibility>
      <implementationChecklist>
        <item>Update sidebars, inspectors, and toolbars with the 2025 macOS Liquid Glass component set; remove legacy custom blurs.</item>
        <item>Re-export app and widget icons through Icon Composer to ensure clear variants meet contrast requirements.</item>
        <item>Share SwiftUI and AppKit references so teams adopt system glass stacks instead of bespoke composites.</item>
        <item>Confirm color filters and text scaling retain legibility in multi-column data views.</item>
      </implementationChecklist>
    </platform>
  </platforms>
</agentDesignGuide>
