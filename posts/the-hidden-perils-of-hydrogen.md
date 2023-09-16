---
title: "The Hidden Perils of Hydrogen"
date: 2023-01-25
author: Yudhister Kumar
type: blog
keywords: ['energy']
description: "Novel Hydrogen storage technologies are necessary for a clean energy future"
---
> Note (as of Jan 27, 2023): I do not endorse some aspects of this post as is. Namely, the figures and lack of citations. Editing in progress. 

Hydrogen is the fuel of the future. It’s the most abundant element in the universe, is incredibly mass-efficient, and can be produced without much fuss. It can be used for both large and small scale energy production (think fusion and fuel cells respectively), and has virtually no emissions, carbon or otherwise. However, there’s just one problem.

It’s absurdly volume-inefficient. 

One liter of hydrogen can produce 0.01 MJ of energy at STP (standard temperature and pressure, 273K and 1atm) compared to 34 MJ/L for gasoline. That’s 0.02% of the energy output for liter. Granted, things improve drastically for liquid hydrogen, where the comparison is 8 MJ/L vs 34, but this requires maintenance of temperatures below −252.8°C, only a few degrees above absolute zero. 

Gaseous hydrogen isn’t that easy to store either: it requires containers pressurizable up to 700 bar (700x atmospheric pressure). That’s 10,000 PSI. And even then, it takes 5L of hydrogen to match up to 1L of gasoline. The Department of Energy estimates that to meet most lightweight vehicular driving ranges, between 5-13 kg of hydrogen need to be carried onboard the vehicle. If we do some quick calculations, that means that vehicles need to carry between 85 - 294 L of liquid hydrogen (some multiple of this for gaseous hydrogen) to go anywhere. For all you Americans, this is roughly between 22-77 gallons. 

(For reference, 5-13kg of hydrogen converts to 20-70 liters of gasoline, in terms of energy efficiency. I also make no claim as to the specific accuracy of the numbers, these are napkin calculations, and this doesn’t take into account energy efficiencies created by recycling hydrogen or fuel cells being more efficient than combustion engines, etc.)

It would not be feasible to have stereotypical sedans with fifty gallon gas tanks in a world of solely hydrogen fuel. Additionally, the extreme conditions liquid hydrogen must be stored as bottlenecks its production and transportation. 

The Department of Energy set standards for hydrogen storage to be met by 2020 in order for hydrogen fuel to become feasible for portable power and light-duty vehicular applications. These were:
- 1.5 kWh/kg (overall system performance)
- 1.0 kWh/L (overall system performance)
- $10/kWh (translates to $333/kg for stored hydrogen)

So far, none of these goals have been met, and I have doubts about the scalability of present research (although I’m open to criticism on this take). Let’s take a look at what’s being done to fix the issue. 

## Short-term Solutions

The majority of short-term solutions to hydrogen’s issues as a widespread fuel consist of creating inexpensive, high pressure storage solutions for H2 gas. From the Department of Energy’s website again, this means developing fiber-reinforced composites that can be produced cheaply and withstand 700 bar pressures. As these don’t necessarily address the underlying volume-inefficiency problem, we can move on to the long-term solutions.

## Long-term Solutions

Long-term solutions take two forms: **higher-density gaseous storage** and **materials-based hydrogen storage**. The former develops vessels that can compress H2 gas more, while the latter seeks to manufacture materials that have better volumetric hydrogen ratios. This will mainly focus on the materials based approach. 

The main research avenues for materials-based hydrogen storage are metal hydrides, adsorbents, and chemical hydrogen storage materials. Let’s look at each.

### Metal Hydrides

Metal hydrides are compounds in which metal atoms form ligands with hydrogen. The strength and nature of these bonds vary widely with the metal, but they allow compounds to act as hydrogen carriers without getting decomposed themselves, which is useful for materials cycling (and drastically improves efficiency).

The issue is, the sorts of complex hydrides that have the most promising properties cannot be produced at scale cheaply in any amount, let alone the quantities required for hydrogen to become a serious competitor to gasoline. However, if these compounds were able to scale, then I would be very excited about our energy futures.

### Adsorbents 

Adsorption is the process by which molecules stick to the internal or external surface of something. Attaching hydrogen gas to some compound would allow it to retain its original molecular form and simultaneously compress it (by virtue of gases being quite volume inefficient). The issue with these is that they don’t compress from the original that much, and are expensive to make. 

### Chemical Hydrogen Storage Materials

These are perhaps the most straightfoward: find materials that you can either hydrolyze or pyrolyze to release hydrogen, and hope that they have less volume than liquid hydrogen and that they’re easier to store. Well, lo and behold, it turns out there’s an entire class of molecules like this: Amine-boranes.

Amine-boranes are essentially ammonia molecules complexed to boron with extra hydrogen thrown in. The simplest amine-borane is ammonia borane, or borazane, with the chemical formula NH3BH3. It hydrolyzes and pyrolyzes well, has a higher molar density of hydrogen than hydrogen itself, and is a stable solid at room temperature. What more could you ask for?

Well, it’s absurdly expensive to synthesize. I suspect the cost can be reduced at scale, but it does not seem feasible at the moment. 
