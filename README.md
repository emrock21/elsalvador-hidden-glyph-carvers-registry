# El Salvador Hidden Nahua Pipil Glyph-Carving Lineages Registry

On-chain registry of Nahua Pipil glyph-carving traditions from El Salvador.

This contract documents communities that preserve:

- Volcanic stone carving
- Cosmological glyphs (sun, maize, water, serpent, mountain)
- Ritual uses in protection, agriculture, and community ceremonies
- Intergenerational transmission of carving techniques

---

## Contract

Deployed on Base:  
`0x2873408471015e3c22be5c147a2278891926ea36`  
🔗 https://basescan.org/address/0x2873408471015e3c22be5c147a2278891926ea36#code

---

## Contract interface

solidity

recordGlyphLineage(
  string region,
  string community,
  string lineageName,
  string glyphType,
  string culturalNote,
  string whyItMatters
);

voteGlyphLineage(uint256 id, bool like);

totalLineages();

---

Purpose

This registry preserves the cultural memory of Nahua Pipil glyph-carving traditions in El Salvador.
