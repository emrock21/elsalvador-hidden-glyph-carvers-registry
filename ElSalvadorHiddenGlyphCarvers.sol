// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

contract ElSalvadorHiddenGlyphCarvers {

    struct GlyphLineage {
        string region;
        string community;
        string lineageName;
        string glyphType;
        string culturalNote;
        string whyItMatters;
        address creator;
        uint256 likes;
        uint256 dislikes;
        uint256 createdAt;
    }

    GlyphLineage[] public lineages;

    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event GlyphLineageRecorded(
        uint256 indexed id,
        string lineageName,
        string community,
        address indexed creator
    );

    event GlyphLineageVoted(
        uint256 indexed id,
        bool like,
        uint256 likes,
        uint256 dislikes
    );

    constructor() {
        lineages.push(
            GlyphLineage({
                region: "Sonsonate",
                community: "ExampleCommunity",
                lineageName: "Example Lineage (replace with real entries)",
                glyphType: "example glyph",
                culturalNote: "This is an example entry to illustrate the format.",
                whyItMatters: "Real entries should describe ritual or cosmological relevance.",
                creator: address(0),
                likes: 0,
                dislikes: 0,
                createdAt: block.timestamp
            })
        );
    }

    function recordGlyphLineage(
        string calldata region,
        string calldata community,
        string calldata lineageName,
        string calldata glyphType,
        string calldata culturalNote,
        string calldata whyItMatters
    ) external {
        require(bytes(region).length > 0, "Region required");
        require(bytes(community).length > 0, "Community required");
        require(bytes(lineageName).length > 0, "Lineage name required");

        lineages.push(
            GlyphLineage({
                region: region,
                community: community,
                lineageName: lineageName,
                glyphType: glyphType,
                culturalNote: culturalNote,
                whyItMatters: whyItMatters,
                creator: msg.sender,
                likes: 0,
                dislikes: 0,
                createdAt: block.timestamp
            })
        );

        emit GlyphLineageRecorded(
            lineages.length - 1,
            lineageName,
            community,
            msg.sender
        );
    }

    function voteGlyphLineage(uint256 id, bool like) external {
        require(id < lineages.length, "Invalid ID");
        require(!hasVoted[id][msg.sender], "Already voted");

        hasVoted[id][msg.sender] = true;

        GlyphLineage storage g = lineages[id];

        if (like) {
            g.likes += 1;
        } else {
            g.dislikes += 1;
        }

        emit GlyphLineageVoted(id, like, g.likes, g.dislikes);
    }

    function totalLineages() external view returns (uint256) {
        return lineages.length;
    }
}
