# IR Brute Force - Quick Reference Card

## Quick Start (30 seconds)

```
┌────────────────────────────────────┐
│ 1. Point IR LED at TV (1-3 meters)│
│ 2. Select "Quick: TV Power Codes" │
│ 3. Watch TV - should turn on/off  │
│ 4. Note code if it works!          │
└────────────────────────────────────┘
```

---

## Attack Modes

### 🎯 Quick TV Power (30-60 seconds)
**Best for:** Just turning TV on/off
- Tries 50+ known power codes
- Works on ~70% of TVs
- Fastest method

### 🧠 Smart Brute (Recommended)
**Best for:** Full remote functionality
- Tries common codes first (30 sec)
- Then systematic brute (1-4 hours)
- Highest success rate

### 📊 Sequential Brute
**Best for:** Complete coverage
- Tries every code in range
- Can resume if stopped
- Time varies by range

### 🎲 Random Brute (5 minutes)
**Best for:** Quick luck-based test
- Tries 1,000 random codes
- Good for unknown devices
- Fast but no guarantee

---

## Brand Presets

### Samsung TV
```
Protocol: Samsung
Common codes:
Power:      0xE0E040BF
Vol Up:     0xE0E0D02F
Vol Down:   0xE0E048B7
Input:      0xE0E008F7
Channel Up: 0xE0E006F9
```

### LG TV
```
Protocol: NEC
Common codes:
Power:    0x20DF10EF
Vol Up:   0x20DF40BF
Vol Down: 0x20DFC03F
Input:    0x20DF00FF
Mute:     0x20DF807F
```

### Sony TV
```
Protocol: Sony (SIRC)
Common codes:
Power:    0xA90
Input:    0x750
Vol Up:   0x2D0
Vol Down: 0x010
Mute:     0x490
```

---

## Protocol Quick Select

```
┌──────────────────────────────────────┐
│ Brand          → Protocol             │
├──────────────────────────────────────┤
│ Samsung TV     → Samsung              │
│ LG TV          → NEC                  │
│ Sony TV        → Sony (SIRC)          │
│ Panasonic      → NEC                  │
│ Sharp          → NEC                  │
│ Toshiba        → NEC                  │
│ Vizio          → NEC                  │
│ Unknown/Euro   → Try RC5 or RC6       │
│ Generic/DIY    → Start with NEC       │
└──────────────────────────────────────┘
```

---

## Time Estimates

### By Code Range
```
Range           │ Codes   │ Time @ 300ms delay
────────────────┼─────────┼───────────────────
0x00-0xFF       │ 256     │ 1.3 minutes
0x000-0xFFF     │ 4,096   │ 20 minutes
0x0000-0xFFFF   │ 65,536  │ 5.5 hours
0x000000-0xFFFF │ 16.7M   │ Impractical
```

### Quick Mode Times
```
Power Codes:    30-60 seconds
Smart Brute:    30 sec - 4 hours
Random (1000):  5 minutes
```

---

## Configuration Cheat Sheet

### Delay Settings
```
100ms  → Very fast (may miss)
200ms  → Fast
300ms  → Recommended ✓
500ms  → Slower, more reliable
1000ms → Very slow, best observation
```

### Range Settings
```
Small test:    0x0000 → 0x00FF
Medium test:   0x0000 → 0x0FFF
Large test:    0x0000 → 0xFFFF
Brand-specific: Use preset
```

---

## Positioning Guide

### Distance
```
Too close:  < 0.5m  (may not work)
Ideal:      1-3m    ✓
Maximum:    5-10m   (with good LED)
```

### Line of Sight
```
Direct:     ████████ → [Device]  ✓
Angled:     ████
                 ╲
                  → [Device]  ⚠️ May work
Blocked:    ████ [█] [Device]  ✗ Won't work
```

### Finding IR Receiver
```
Usually located:
├─ Front panel center
├─ Near power LED
├─ Behind logo/smoked plastic
└─ Lower corner of screen
```

---

## Troubleshooting

### ❌ No Response

**Check:**
1. ✓ IR LED working? (view with phone camera)
2. ✓ Correct protocol selected?
3. ✓ Line of sight clear?
4. ✓ Device in standby mode?
5. ✓ Within 3 meter range?

**Try:**
- Different angle
- Closer distance
- Different protocol
- Test with known code

### ⚠️ Inconsistent Response

**Solutions:**
- Increase delay (500ms+)
- Get closer to device
- Check for interference
- Verify IR LED power

### 📡 Found Code Doesn't Always Work

**Fix:**
- Use correct protocol
- Increase repeat count
- Verify code with test function
- Check distance/angle

---

## Watch For These Responses

```
✓ Power LED changes color
✓ Display turns on/off
✓ Volume bar appears
✓ Menu pops up
✓ Input source changes
✓ Any beep/click sound
✓ Screen flickers
✓ Remote symbol shows
```

---

## Resume Feature

### How to Resume
```
1. During brute → Press ANY KEY
2. Script shows current position
3. Exit and restart later
4. Check position in Config menu
5. Start Sequential Brute again
6. Continues from saved position
```

### When to Resume
- ✓ Long attacks (hours)
- ✓ Battery low
- ✓ Need to check device
- ✓ Device turned off
- ✓ Multi-day brute force

---

## Common Code Patterns

### NEC Pattern Recognition
```
If code: 0x20DF10EF works

Try nearby:
├─ 0x20DF00EF (different command)
├─ 0x20DF20EF (next command)
├─ 0x20DF11EF (variant)
└─ 0x20DF0000-0x20DFFFFF (full range)
```

### Samsung Pattern
```
Samsung codes often start with:
0xE0E0xxxx

Common endings:
├─ 40BF (Power)
├─ D02F (Vol+)
├─ 48B7 (Vol-)
└─ 08F7 (Input)
```

---

## Strategy Decision Tree

```
Do you know the brand?
│
├─ YES → Load brand preset → Smart Brute
│
└─ NO  → Try power codes first
         │
         ├─ Worked? → Note code → Narrow range
         │
         └─ Failed? → Try NEC 0x0000-0xFFFF
                      │
                      ├─ Still failed? → Try Sony protocol
                      │
                      └─ Still failed? → Try Samsung protocol
```

---

## Power Code Database Top 20

```
1.  0xE0E040BF  (Samsung)
2.  0x20DF10EF  (LG)
3.  0xA90       (Sony)
4.  0x20DF23DC  (LG alt)
5.  0xE0E09966  (Samsung alt)
6.  0x41C0      (Sharp)
7.  0x02FD48B7  (Toshiba)
8.  0x20DF0FF0  (Generic NEC)
9.  0x750       (Sony alt)
10. 0x20DFC03F  (LG Vol-)
11. 0xE0E019E6  (Samsung alt2)
12. 0xA50       (Sony alt2)
13. 0x20DF708F  (Generic)
14. 0x51A8      (Sharp alt)
15. 0x2FD48B7   (Toshiba alt)
16. 0x0C        (Philips RC5)
17. 0x57E31ACB  (TCL/Roku)
18. 0x10EF10EF  (Hisense)
19. 0x20DF00FF  (LG Input)
20. 0xE0E0D02F  (Samsung Vol+)
```

---

## Testing Workflow

### Pre-Attack Test
```
1. Test IR LED with phone camera
2. Try test code (0x20DF10EF)
3. Verify device responds to IR
4. Set appropriate delay
5. Start attack
```

### During Attack
```
1. Watch device continuously
2. Note any response (even small)
3. Can stop and test specific code
4. Adjust delay if needed
5. Try different angles
```

### Post-Attack
```
1. Document working codes
2. Test each code individually
3. Map codes to functions
4. Save for future use
```

---

## IR LED Verification

### Method 1: Phone Camera
```
1. Open phone camera
2. Point IR LED at camera
3. Trigger IR transmission
4. See purple/white light? ✓ Working
5. See nothing? ✗ Not working
```

### Method 2: Known Code
```
1. Find working remote
2. Look up its codes online
3. Test known code
4. Device responds? ✓ LED works
5. No response? Check wiring
```

---

## Protocol Frequency Reference

```
Protocol │ Carrier │ Common Devices
─────────┼─────────┼────────────────────
NEC      │ 38 kHz  │ LG, Panasonic, most
Samsung  │ 38 kHz  │ Samsung devices
Sony     │ 40 kHz  │ Sony, PlayStation
RC5      │ 36 kHz  │ Philips, Euro brands
RC6      │ 36 kHz  │ Set-top boxes
```

---

## Success Rate by Device Type

```
Device Type    │ Success Rate │ Avg Time
───────────────┼──────────────┼──────────
TV (modern)    │ 85-95%       │ 5-30 min
TV (old)       │ 70-80%       │ 10-60 min
AC Unit        │ 60-70%       │ 20-90 min
Projector      │ 75-85%       │ 10-40 min
Set-top box    │ 65-75%       │ 15-60 min
Fan            │ 50-60%       │ 30-120 min
```

---

## Advanced Tips

### Narrowing Range
```
If you found: 0x20DF10EF

Test:
├─ 0x20DF10E0 to 0x20DF10FF (±15)
├─ 0x20DF0000 to 0x20DF1FFF (wider)
└─ 0x20DF0000 to 0x20DFFFFF (full prefix)
```

### Multi-Protocol Test
```
Unknown device?

1. NEC @ 0x0000-0xFFFF       (1-2 hrs)
2. Samsung @ 0xE0E0xxxx      (30 min)
3. Sony @ 0x000-0xFFF        (10 min)
4. RC5 if European           (5 min)
```

---

## When to Give Up

### Stop if:
- ❌ Tried all major protocols
- ❌ Tested 100,000+ codes
- ❌ Device confirmed uses RF/Bluetooth
- ❌ No IR receiver visible
- ❌ Phone camera doesn't show IR LED

### Instead Try:
- ✓ Universal remote codes online
- ✓ Device manufacturer support
- ✓ Replace remote (often $10-30)
- ✓ LIRC database search
- ✓ Community forums

---

## Resources

### Online Code Databases
```
LIRC:           lirc.sourceforge.net
RemoteCentral:  remotecentral.com
IrScrutinizer:  github.com/bengtmartensson
RemoteDB:       Various forums
```

### Tools
```
Phone Camera:    Verify IR LED
Flipper Zero:    IR capture/replay
Arduino:         IRremote library
IrScrutinizer:   Protocol analyzer
```

---

## Safety Notes

### Legal ✓
- Your own devices
- With permission
- Learning purposes
- Universal remote use

### Ethical ⚠️
- Hotel TVs (gray area)
- Friend's devices (ask first)
- Public displays (policy dependent)

### Not Recommended ✗
- Disrupting businesses
- Public disturbances
- Malicious use
- Annoying strangers

---

## Common Mistakes

### ❌ Mistake 1: Wrong Protocol
**Fix:** Try all common protocols (NEC, Samsung, Sony)

### ❌ Mistake 2: Too Fast
**Fix:** Increase delay to 300-500ms

### ❌ Mistake 3: Not Watching Device
**Fix:** Observe continuously, note responses

### ❌ Mistake 4: Giving Up Too Soon
**Fix:** Power codes are quick, try those first

### ❌ Mistake 5: Wrong Distance/Angle
**Fix:** 1-3 meters, direct line of sight

---

## Legend

```
✓ - Recommended
✗ - Not recommended
⚠️ - Use with caution
🎯 - Quick win
🧠 - Smart choice
📊 - Thorough method
🎲 - Luck-based
```

---

**Remember:** Start with power codes for quickest results!

**Phone Camera Trick:** View IR LED through camera to verify it's working

**Success Tip:** Use Smart Brute mode for best balance of speed and coverage
