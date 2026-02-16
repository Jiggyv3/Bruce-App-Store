# IR Brute Force Tool - Complete Guide

## Overview

IR (Infrared) brute forcing is a technique for finding working remote control codes by systematically trying different code combinations. Unlike RF jamming, IR brute forcing is **completely legal** for personal use since:

- IR has very short range (line of sight, few meters)
- Not regulated by FCC or other agencies
- Common use case for universal remotes
- No interference with critical infrastructure

## What This Script Does

### Features
- ✅ **TV Power Code Database**: 50+ known power on/off codes
- ✅ **Smart Brute Force**: Tries common codes first, then full range
- ✅ **Brand Presets**: Samsung, LG, Sony, Panasonic, Generic
- ✅ **Multiple Protocols**: NEC, Samsung, Sony (SIRC), RC5, RC6
- ✅ **Resume Capability**: Stop and continue from where you left off
- ✅ **Random Mode**: Try random codes for quick testing
- ✅ **Progress Tracking**: Real-time ETA and statistics

### Supported Devices
- 📺 **TVs** - All major brands
- ❄️ **Air Conditioners** - Most IR-controlled units
- 📽️ **Projectors** - Common models
- 📦 **Set-top Boxes** - Cable/satellite receivers
- 🔊 **Audio Equipment** - Receivers, soundbars
- 🌡️ **Fans** - IR-controlled fans

---

## Hardware Requirements

### Required
- **ESP32 CYD-2432S028** (Cheap Yellow Display)
- **IR LED** or **NM-RF HAT with IR module**
- **Bruce Firmware** installed

### IR LED Connection (if not using NM-RF HAT)
```
IR LED Pins (typical):
- Anode (+) → GPIO via 100Ω resistor
- Cathode (-) → GND

NM-RF HAT:
- Pre-built IR transmitter
- No additional wiring needed
```

### IR LED Types
- **940nm wavelength** (most common)
- **850nm wavelength** (alternative)
- High-power IR LEDs work best
- Multi-LED arrays increase range

---

## IR Protocols Explained

### 1. NEC Protocol (Most Common)
```
Used by: LG, Panasonic, Sharp, Toshiba, many generics
Code format: 32-bit
Example: 0x20DF10EF (LG TV Power)

Structure:
[Address 8-bit][Address Inverse 8-bit][Command 8-bit][Command Inverse 8-bit]
```

**Characteristics:**
- 38kHz carrier frequency
- 9ms leading pulse
- Very common and reliable
- Easy to brute force (predictable structure)

### 2. Samsung Protocol
```
Used by: Samsung TVs, some other devices
Code format: 32-bit
Example: 0xE0E040BF (Samsung TV Power)

Similar to NEC but with Samsung-specific encoding
```

### 3. Sony (SIRC) Protocol
```
Used by: Sony TVs, PlayStation, audio equipment
Code format: 12, 15, or 20-bit
Example: 0xA90 (Sony TV Power)

Structure varies by bit length
Repeated 3 times for reliability
```

**Characteristics:**
- 40kHz carrier frequency
- 2.4ms leading pulse
- Shorter codes than NEC
- Multiple bit lengths

### 4. RC5 Protocol
```
Used by: Philips, some European brands
Code format: 13-bit
Example: 0x0C (Power toggle)

Bi-phase Manchester encoding
No carrier during gaps
```

### 5. RC6 Protocol
```
Used by: Philips, some set-top boxes
Code format: Variable length (usually 20-bit)

Successor to RC5
More complex encoding
```

---

## Usage Guide

### Quick Start: TV Power Code Attack

**Best for:** Turning on/off an unknown TV

1. Load the script on your CYD
2. Point IR LED at TV (1-3 meters)
3. Select **"Quick: TV Power Codes"**
4. Watch your TV - it should turn on or off when the right code is sent
5. Note which code worked!

**Time:** ~30-60 seconds (tries 50+ codes)

---

### Smart Brute Force (Recommended)

**Best for:** Finding full remote control codes

#### Step 1: Choose Brand
1. Go to **"Configure"**
2. Select **"Brand"**
3. Choose your device brand (e.g., "Samsung TV")

#### Step 2: Start Smart Brute
1. Return to main menu
2. Select **"Smart Brute (Recommended)"**
3. Script will first try 5-10 common codes for that brand
4. If nothing works, continues with full range

**Time:** 
- Common codes: 30 seconds
- Full brute: 1-4 hours (depends on range)

---

### Sequential Brute Force

**Best for:** Systematic coverage of code range

1. **Configure** your range (or use brand preset)
2. Select **"Sequential Brute"**
3. Wait and watch device

**Tips:**
- Start with small ranges (0x0000 to 0xFFFF)
- Watch device closely for any response
- Can resume if stopped

**Time Examples:**
```
Range          | Codes  | Time @ 300ms
---------------|--------|-------------
0x0000-0x00FF  | 256    | 1.3 minutes
0x0000-0x0FFF  | 4,096  | 20 minutes
0x0000-0xFFFF  | 65,536 | 5.5 hours
Full 32-bit    | 4.29B  | Impractical!
```

---

### Random Brute Force

**Best for:** Quick testing when you have no idea

1. Set your code range
2. Select **"Random Brute"**
3. Script tries up to 1,000 random codes

**When to use:**
- Don't know the brand
- Want to try luck quickly
- Testing multiple devices

**Time:** ~5 minutes (1,000 codes)

---

## Configuration Guide

### Brand Presets

#### Samsung TV
```
Protocol: Samsung
Range: 0xE0E00000 to 0xE0E0FFFF
Common codes:
- 0xE0E040BF (Power)
- 0xE0E0D02F (Volume Up)
- 0xE0E048B7 (Volume Down)
- 0xE0E008F7 (Source)
- 0xE0E006F9 (Channel Up)
```

#### LG TV
```
Protocol: NEC
Range: 0x20DF0000 to 0x20DFFFFF
Common codes:
- 0x20DF10EF (Power)
- 0x20DF40BF (Volume Up)
- 0x20DFC03F (Volume Down)
- 0x20DF00FF (Input)
- 0x20DF807F (Mute)
```

#### Sony TV
```
Protocol: Sony (SIRC)
Range: 0x000 to 0xFFF
Common codes:
- 0xA90 (Power)
- 0x750 (Input)
- 0x2D0 (Volume Up)
- 0x010 (Volume Down)
- 0x490 (Mute)
```

#### Generic TV
```
Protocol: NEC
Range: 0x00000000 to 0x0000FFFF
Start with common prefixes:
- 0x10EF, 0x40BF, 0xC03F
```

### Delay Settings

**Delay between codes:**

- **100-200ms**: Very fast, may miss responses
- **300ms** (recommended): Good balance
- **500-1000ms**: Slower, better for observation
- **1500ms+**: Testing specific codes

**Consider:**
- Device response time
- IR receiver sensitivity
- Your ability to observe changes

### Protocol Selection

**How to choose:**

1. **Know the brand?**
   - Samsung TV → Samsung protocol
   - LG/Panasonic → NEC protocol
   - Sony → Sony (SIRC) protocol

2. **Unknown brand?**
   - Start with NEC (most common)
   - Try Samsung if NEC fails
   - Try Sony for older devices

3. **European device?**
   - Try RC5 or RC6

---

## Brute Force Strategies

### Strategy 1: Power Codes First
```
Use Case: Just want to turn TV on/off
Method: Quick TV Power Codes
Time: 30-60 seconds
Success Rate: ~70% for TVs
```

### Strategy 2: Brand-Specific
```
Use Case: Know the brand
Method: Load brand preset → Smart Brute
Time: 30 sec - 2 hours
Success Rate: ~90% if brand correct
```

### Strategy 3: Protocol Testing
```
Use Case: Unknown brand
Method: Try each protocol with small range
Steps:
1. NEC: 0x0000 to 0xFFFF
2. Samsung: 0xE0E00000 to 0xE0E0FFFF  
3. Sony: 0x000 to 0xFFF
Time: 2-6 hours total
Success Rate: ~80%
```

### Strategy 4: Narrowing Down
```
Use Case: Partial code known
Example: You know it starts with 0x20DF
Method: 
1. Set start: 0x20DF0000
2. Set end: 0x20DFFFFF
3. Sequential brute
Time: 1-2 hours
Success Rate: High if prefix correct
```

---

## Tips & Tricks

### Positioning

**IR LED Placement:**
- **Distance**: 1-3 meters (3-10 feet) works best
- **Angle**: Direct line of sight preferred
- **Height**: Aim at device's IR receiver
- **Obstacles**: Remove anything blocking path

**Finding the IR Receiver:**
- Usually front panel of device
- Often near power LED
- Sometimes behind smoked plastic
- Try different angles if not working

### Observation Tips

**Watch for:**
- ✅ Power LED changes
- ✅ Display flickers
- ✅ Menu appears
- ✅ Volume bar shows
- ✅ Any on-screen response
- ✅ Device beeps or clicks

**During brute force:**
- Don't leave device unattended
- Watch continuously for responses
- Note code number if something happens
- Can stop and test specific code

### Optimization

**Speed up success:**

1. **Use Smart Brute** - tries common codes first
2. **Start with power codes** - quick verification
3. **Test known working remote** - verify IR LED works
4. **Narrow range** - if you have partial info
5. **Try multiple protocols** - if brand unknown

### Troubleshooting

**No response from device:**
- ✓ Check IR LED is working (view with phone camera)
- ✓ Verify protocol is correct
- ✓ Try different angle/distance
- ✓ Check device is in standby (some only respond when on)
- ✓ Verify device uses IR (not Bluetooth/RF)

**Partial success:**
- One button works → You're in the right range!
- Note the working code
- Try codes nearby (±10-100 from working code)

**Sporadic results:**
- IR receiver might be weak
- Increase delay between codes
- Get closer to device
- Check IR LED power

---

## Resume Feature

### How it Works

The script tracks your position during sequential brute force:

1. **During attack** - Press any key to stop
2. **Script saves** - Current code position
3. **Resume later** - Continues from saved position
4. **Reset** - Manual reset to start over

### When to Use Resume

**Good scenarios:**
- Long brute force (hours)
- Device turned off unexpectedly  
- Battery running low
- Need to check results
- Multi-day attacks

**Steps:**
1. Stop brute force (hold key)
2. Note position shown
3. Exit script
4. Later: Restart script
5. Go to Configure → Position shows saved spot
6. Start Sequential Brute - resumes automatically

---

## Testing & Verification

### Test Single Code

**Use this to:**
- Verify a specific code works
- Test codes found online
- Check IR LED is working

**Steps:**
1. Select "Test Single Code"
2. Enter code in hex (e.g., "20DF10EF")
3. Watch device for response

### Verify IR LED Works

**Method 1: Phone Camera**
- Point IR LED at phone camera
- Press any button (or run test code)
- IR LED will appear purple/white on screen
- Human eyes can't see IR, but camera can!

**Method 2: Test Known Remote**
- Use a working TV remote
- Copy a known working code
- If it works, your IR LED is good

---

## Code Databases & Resources

### Online IR Code Databases

**LIRC (Linux Infrared Remote Control)**
- http://lirc.sourceforge.net/remotes/
- Thousands of remote codes
- Multiple formats

**IrScrutinizer**
- https://github.com/bengtmartensson/IrScrutinizer
- IR protocol analyzer
- Can generate codes

**RemoteCentral**
- http://www.remotecentral.com
- User-contributed codes
- Device-specific forums

### Universal Remote Codes

Many universal remotes use similar code sets:
- RCA codes
- Philips codes  
- Sony codes
- Zenith codes

These can be found online and converted to hex.

---

## IR Protocol Technical Details

### Carrier Frequency

Most IR protocols use a **carrier frequency** - the LED blinks very fast while transmitting:

- **38 kHz** - NEC, Samsung, most devices
- **40 kHz** - Sony (SIRC)
- **36 kHz** - Some older devices
- **56 kHz** - Some RC5/RC6

Your IR module should support 38kHz for maximum compatibility.

### Modulation

**PWM (Pulse Width Modulation):**
- Data encoded by pulse duration
- NEC, Samsung use PWM

**PPM (Pulse Position Modulation):**
- Data encoded by pulse spacing
- RC5, RC6 use PPM

**Manchester Encoding:**
- Each bit has a transition
- RC5 uses this

### Timing

**Critical timing parameters:**

**NEC Protocol:**
```
Leading pulse: 9ms ON, 4.5ms OFF
Logic '0': 560μs ON, 560μs OFF
Logic '1': 560μs ON, 1690μs OFF
Bit time: ~2.24ms per bit
```

**Sony Protocol:**
```
Leading pulse: 2.4ms ON, 600μs OFF
Logic '0': 600μs ON, 600μs OFF
Logic '1': 1200μs ON, 600μs OFF
Repeat: Sent 3 times
```

---

## Advanced Techniques

### Building Code Patterns

Many devices use predictable patterns:

**Pattern 1: Sequential Commands**
```
Power: 0x20DF10EF
Input: 0x20DF00FF
Menu:  0x20DF20DF

Notice the third byte increments
```

**Pattern 2: Grouped Functions**
```
Volume Up:    0xE0E0D02F
Volume Down:  0xE0E048B7
Channel Up:   0xE0E006F9
Channel Down: 0xE0E046B9

Related functions often near each other
```

### Creating Custom Ranges

If you find a working code, try nearby codes:

**Example:**
```
Working code: 0x20DF10EF

Try:
0x20DF00EF to 0x20DF20EF (±16 range)
0x20DF10E0 to 0x20DF10FF (last byte)
0x20DF0000 to 0x20DFFFFF (all codes with same prefix)
```

---

## Real-World Examples

### Example 1: Lost TV Remote

**Scenario:** Samsung TV, lost remote

**Solution:**
1. Load script
2. Select "Quick: TV Power Codes"
3. TV turned on at code #12 (0xE0E040BF)
4. Load Samsung TV preset
5. Run Smart Brute
6. Found: Volume, Channel, Menu codes
7. Can now control TV with phone/CYD

**Time:** 15 minutes total

### Example 2: Hotel Room TV

**Scenario:** Hotel TV, no remote, want to change input

**Solution:**
1. Unknown brand TV
2. Try power codes first (didn't work)
3. Load Generic TV preset
4. Run Sequential Brute with 0x0000-0xFFFF
5. After 20 minutes, found working codes
6. Changed input to HDMI

**Time:** 20 minutes

### Example 3: Old Projector

**Scenario:** Projector remote broken, unknown brand

**Solution:**
1. Tried NEC protocol (didn't work)
2. Switched to Sony protocol
3. Random brute for 5 minutes
4. Found power code: 0x750
5. Narrowed range around 0x750
6. Found all needed codes

**Time:** 30 minutes

---

## Safety & Ethics

### Is IR Brute Forcing Legal?

**YES - IR brute forcing is legal for:**
- ✅ Your own devices
- ✅ Devices you have permission to control
- ✅ Learning and experimentation
- ✅ Universal remote programming
- ✅ Fixing broken remotes

**Questionable:**
- ⚠️ Hotel room TVs (technically their property)
- ⚠️ Public displays (may violate policies)
- ⚠️ Businesses (without permission)

**Definitely Illegal:**
- ❌ Disrupting others' devices maliciously
- ❌ Public displays intended to annoy
- ❌ ATM PIN pads (this would be hacking)
- ❌ Security systems

### Ethical Guidelines

**Do:**
- Control your own devices
- Help friends/family with permission
- Learn IR protocols
- Develop universal remotes

**Don't:**
- Disrupt strangers' devices
- Cause public disturbances
- Interfere with businesses
- Be a jerk

### TV-B-Gone Ethics

*Note: TV-B-Gone is a commercial device that does similar things*

While legal to own, using it to turn off TVs in:
- Restaurants/bars → Rude, possibly trespassing if asked to leave
- Airports → Could miss important announcements
- Hospitals → Potentially dangerous
- Friend's house → Funny once, annoying if repeated

**Bottom line:** Having the tool is fine, but use it responsibly.

---

## Performance Optimization

### Increasing Range

**Hardware:**
- Use high-power IR LEDs (100mA+)
- Multiple LEDs in parallel
- Add focusing lens
- Use IR LED arrays

**Software:**
- Increase repeat count in code
- Longer ON times (if supported)
- Try different protocols (some have better range)

### Increasing Speed

**Without sacrificing reliability:**
- Reduce delay to 200ms (from 300ms)
- Use Random mode for quick tests
- Start with common codes (Smart Brute)
- Skip irrelevant ranges

**Maximum speed:**
- Delay: 100ms (risky - may miss responses)
- No repeats
- But you might miss the working code!

---

## Troubleshooting Guide

### Problem: No IR output

**Checks:**
1. View IR LED through phone camera
2. Test with known code
3. Check IR LED polarity
4. Verify GPIO pin configuration
5. Test with different protocol

### Problem: Device responds inconsistently

**Solutions:**
1. Increase delay between codes
2. Get closer to device
3. Improve line of sight
4. Check for IR interference
5. Try different protocol

### Problem: Found code doesn't always work

**Causes:**
- Distance too far
- Wrong protocol selected
- Weak IR LED
- Device requires repeats

**Fix:**
- Increase repeat count
- Use correct protocol
- Get closer
- Verify code with test function

### Problem: Brute force taking too long

**Solutions:**
1. Use Smart Brute (tries common first)
2. Narrow the range (if possible)
3. Use Random mode for quick test
4. Try power codes database first
5. Use brand preset instead of full range

---

## Appendix: Common Codes

### TV Power Codes (NEC Protocol)

```
Samsung: 0xE0E040BF
LG:      0x20DF10EF
Sony:    0xA90 (SIRC protocol)
Sharp:   0xAA5A51AE
Toshiba: 0x02FD48B7
Philips: 0x0C (RC5 protocol)
Vizio:   0x20DF23DC
TCL:     0x57E31ACB
Hisense: 0x10EF10EF
```

### Common Volume Codes

```
Volume Up (generic):   0x40BF, 0xD02F
Volume Down (generic): 0xC03F, 0x48B7
Mute (generic):        0x906F, 0x807F
```

### AC Unit Codes

```
Power Toggle: 0x8166
Temp Up:      0x9966
Temp Down:    0x59A6
Mode:         0x6897
```

---

## Conclusion

IR brute forcing is a powerful technique for:
- 📺 Controlling devices with lost remotes
- 🔧 Reverse engineering IR protocols
- 🎓 Learning about infrared communication
- 🛠️ Building universal remotes

**Remember:**
- Start with power codes for quick wins
- Use Smart Brute for best results
- Be patient with large ranges
- Document codes that work
- Use responsibly!

---

## Resources

**Tools:**
- IrScrutinizer - Protocol analyzer
- LIRC - Code database
- Flipper Zero - IR testing
- Arduino IRremote library

**Communities:**
- r/FlipperZero
- r/arduino
- RemoteCentral forums
- HomeAutomation subreddit

**Learning:**
- San Bergmans' IR site
- LIRC documentation
- Hackaday IR projects
- Maker community tutorials

---

**Happy IR Hacking! 📡**
