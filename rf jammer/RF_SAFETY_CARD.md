# RF Jamming - Quick Safety Reference Card

## ⚠️ BEFORE YOU START ⚠️

### Is This Legal?
```
┌─────────────────────────────────────┐
│ Are you in a Faraday cage/          │
│ RF-shielded enclosure?              │
│                                     │
│  NO  → STOP - It's ILLEGAL         │
│  YES → Continue checking...        │
└─────────────────────────────────────┘

┌─────────────────────────────────────┐
│ Do you OWN all affected devices?   │
│                                     │
│  NO  → STOP - It's ILLEGAL         │
│  YES → Continue checking...        │
└─────────────────────────────────────┘

┌─────────────────────────────────────┐
│ Could this affect anyone else?      │
│                                     │
│  YES → STOP - It's ILLEGAL         │
│  NO  → Continue checking...        │
└─────────────────────────────────────┘

┌─────────────────────────────────────┐
│ Have you verified NO RF leakage     │
│ with a spectrum analyzer?           │
│                                     │
│  NO  → STOP - DON'T TEST           │
│  YES → Proceed with caution        │
└─────────────────────────────────────┘
```

---

## Legal Testing Checklist

### ✓ Before Testing:
- [ ] Inside Faraday cage or RF-shielded box
- [ ] Spectrum analyzer confirms no external emissions
- [ ] Only MY devices being tested
- [ ] Emergency stop button/key ready
- [ ] Test duration planned (keep SHORT)
- [ ] Test log prepared
- [ ] No emergency frequencies in range

### ✓ During Testing:
- [ ] Monitor spectrum analyzer continuously
- [ ] Keep tests brief (seconds, not minutes)
- [ ] Watch for overheating
- [ ] Be ready to stop immediately

### ✓ After Testing:
- [ ] Verify no external interference occurred
- [ ] Document results
- [ ] Check all devices still functional
- [ ] Review any anomalies

---

## Quick Mode Reference

### Continuous Mode
```
Best for: Short robustness tests
Duration: 5-10 seconds MAX
Use when: Testing receiver sensitivity
Risk: Highest detection if leaked
```

### Burst Mode
```
Best for: Intermittent interference testing
Duration: Up to 30 seconds
Use when: Testing error recovery
Risk: Medium detection
Settings: 100ms burst, 50ms delay
```

### Sweep Mode
```
Best for: Wide frequency testing
Duration: Up to 60 seconds
Use when: Testing frequency hopping
Risk: High detection if leaked
Settings: 433-434 MHz, 100kHz steps
```

### Carrier Mode
```
Best for: Simple tone interference
Duration: 5-15 seconds
Use when: Testing narrowband systems
Risk: Easy to detect
Settings: Pure carrier on target freq
```

---

## Emergency STOP Procedures

### If You Suspect RF Leakage:
1. **STOP IMMEDIATELY** - Hold any key
2. Power off the device
3. Disconnect antenna
4. Check with spectrum analyzer
5. If confirmed - discontinue testing

### If Someone Complains About Interference:
1. **STOP IMMEDIATELY**
2. Document what happened
3. Apologize if you caused interference
4. Cease all testing permanently
5. Consider legal consultation

### If Authorities Contact You:
1. **DO NOT lie** or hide equipment
2. Cooperate fully
3. Explain you were testing in shielded environment
4. Show your test documentation
5. Contact a lawyer if charges filed

---

## Penalties Quick Reference

### United States (FCC)
- Fine: **$100 - $112,500 per day**
- Criminal: Up to **$100,000 + 1 year jail**
- Equipment: **Confiscated and destroyed**

### European Union
- Fine: **€10,000 - €500,000**
- Criminal: **6 months - 5 years prison**
- Equipment: **Seized**

### United Kingdom
- Fine: **Unlimited**
- Criminal: Up to **5 years prison**
- Ofcom: **Aggressive enforcement**

### Australia
- Fine: **$222,000 individual / $1.1M corporate**
- ACMA: **Strong prosecution record**

### Canada
- Fine: **$25,000 individual / $5M corporate**
- Criminal: Up to **1 year imprisonment**

---

## Safe Alternatives to Jamming

### Option 1: Faraday Box Testing
```
What: Test devices inside metal enclosure
Cost: $50-500 (DIY to commercial)
Legal: YES (if properly shielded)
Effective: YES
Recommended: ★★★★★
```

### Option 2: Software Simulation
```
What: Simulate RF with GNU Radio
Cost: FREE
Legal: YES (no actual RF)
Effective: Good for learning
Recommended: ★★★★☆
```

### Option 3: RF Shielded Lab
```
What: Professional testing facility
Cost: $500-5000+ per day
Legal: YES
Effective: YES
Recommended: ★★★★★ (for serious work)
```

### Option 4: Cable-Based Testing
```
What: Connect devices via coax cables
Cost: $20-100
Legal: YES
Effective: Moderate
Recommended: ★★★☆☆
```

---

## DIY Faraday Cage

### Simple RF-Shielded Box
```
Materials needed:
- Metal ammo can or toolbox
- RF gasket material (optional)
- Copper mesh (optional upgrade)

Cost: $20-50
Effectiveness: Good for 433 MHz
Size limit: Small devices only

Test procedure:
1. Put devices inside
2. Close lid tightly
3. Use SDR outside to verify no emissions
4. If signal detected, improve sealing
```

### Larger Faraday Room
```
Materials needed:
- Copper mesh or aluminum screen
- Wood/PVC frame
- RF gasket for door
- Ground connection

Cost: $500-2000
Effectiveness: Excellent
Size: Walk-in testing space

Note: Requires proper construction!
Verify shielding with professional measurement
```

---

## Frequency Reference

### NEVER TEST ON THESE:
```
❌ 121.5 MHz      - Aviation emergency
❌ 156.8 MHz      - Marine distress
❌ 406 MHz        - Emergency beacons
❌ 800-900 MHz    - Cellular/public safety
❌ 1575.42 MHz    - GPS
❌ 2.4 GHz        - WiFi (if affects others)
```

### Relatively Safer (but still requires shielding):
```
✓ 433.92 MHz     - Remotes, sensors (ISM)
✓ 315 MHz        - US remotes (limited)
✓ 868 MHz        - EU ISM band
✓ 915 MHz        - US ISM band

BUT ONLY IN SHIELDED ENVIRONMENT!
```

---

## Red Flags That You're Doing It Wrong

### 🚩 Red Flag #1: "Just testing quickly outside"
**Why illegal:** No containment, public interference
**Penalty:** Criminal charges possible

### 🚩 Red Flag #2: "Jamming my neighbor's WiFi"
**Why illegal:** Intentional malicious interference
**Penalty:** Heavy fines + criminal charges

### 🚩 Red Flag #3: "Testing car jammers on the road"
**Why illegal:** Public safety risk
**Penalty:** Federal crime

### 🚩 Red Flag #4: "Seeing how far it reaches"
**Why illegal:** Intentional wide-area interference
**Penalty:** Maximum penalties

### 🚩 Red Flag #5: "Using it to block cell phones"
**Why illegal:** FCC strictly prohibits
**Penalty:** $48,000+ fines documented

---

## Contact Information for Licensing

### United States
**FCC Experimental Licensing**
- Website: fcc.gov/wireless/bureau-divisions/technologies-systems-and-innovation-division/experimental-licensing
- Phone: 1-888-CALL-FCC
- Form: FCC Form 442
- Fee: ~$220
- Time: 6-12 months

### European Union
**Contact national regulator:**
- Germany: BNetzA
- UK: Ofcom
- France: ARCEP
- Varies by country

### Canada
**Innovation, Science and Economic Development**
- Website: ic.gc.ca
- Email: spectrum.engineering@ised-isde.gc.ca

---

## Remember

### The #1 Rule:
```
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃  IF YOU'RE NOT 100% SURE IT'S      ┃
┃  LEGAL - DON'T DO IT!              ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
```

### When in Doubt:
1. Consult a lawyer
2. Contact your telecom regulator
3. Use a professional testing service
4. Stick to simulation software

### Final Warning:
**Ignorance of the law is NOT a defense**
**The penalties are REAL and SEVERE**
**Your criminal record is NOT worth the "test"**

---

**USE RESPONSIBLY OR NOT AT ALL**
