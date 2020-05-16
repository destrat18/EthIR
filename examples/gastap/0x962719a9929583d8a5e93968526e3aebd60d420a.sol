pragma solidity ^0.4.10;

contract addGenesisPairs {
    
address[] newParents;
address[] newChildren;

function addGenesisPairs()    {
    // Set elixor contract address
    elixor elixorContract=elixor(0x898bF39cd67658bd63577fB00A2A3571dAecbC53);
    
    newParents=[
0x730175E759952F5095bF60d5c3c85D407c2eB9E4,
0x54230784eDEf385D167eB9504Dd284c51dE6C996,
0x8ccbDBa85BC76dbD1749d2C47f8cD62a83426B47,
0x019CE4a8b069e6d137c378dFd89b4DDc6BcCffF2,
0x00A42756117f3e47bF6bE3ceb028d016A8d6b17d,
0x09020dCD096B3acFd8eACA799ecAaAa075a6cAef,
0xdC7cAc6bEFa47B0094150A7CfF8614c6d5408738,
0xb17199AEA55ef8C26617b2C3f309b8D8b75D7655,
0x76aCcbB7ec7a59797fD66Db3612d4875005F0560,
0x692B2F9f4C8d156B4ca133e98245Cc640E21C76b,
0x684117341098F511ffBb65F5fee1EDbF2f67d30b,
0xc057F2e785a9D2880ECe5FdB372033649245Af53,
0x81c9BAb5aF4312ece26a6C9627F467B98FAE2829,
0xADbaCD279343A53891403E7D72d70b6eC280e884,
0x807b72F429D1052028780dd5cf48323196816B05,
0xA317F9FC1629f21169a4e4D33a1134E961779e63,
0x848958c447ED70Ba93F67FdbBE71220DbE40bA21,
0x88FC81b513fF8FB40177A0BFeF7f02D0Ef46d681,
0xb8b31162985522AdCe2CA972F4546c7d660B9A9B,
0x3Ecb50750B533796288cDCF95AA46114326E3F12,
0x510931647DE40A6dEEdE99119FE7b82EA544f9c9,
0x5B15a157345c9211Cd7c8eafdCf701801Ebf1c04,
0x3a58bEa3A5AF24c0Ad22c1a97A20a9082108c124,
0x00954f1f83f5B42d1D304D0F09c604a7D639b513,
0x992c562344f7c5bad679b7258a464317F64845b4
    ];
    
    
    
    newChildren=[0xc8010dF5bd2288243d7643C2d035141BA605bd9B,
0xeF5022119898Bcc26304C83F5b031DF8D974D5aA,
0xDc5bd2895ba49e3F72A6935ECF495744034F0861,
0xA955E051a6e4D4d5ac17b17ff3A54ab0b1865F12,
0xe955E5676922B3295a542115d208d13908B33FEA,
0xEAaeE94352cA97115B0a55d6b6B3C0e00332ae41,
0x89D1a1E0955Dc005dCf27732246f10bb4E2EC429,
0x70cdd9c23d45aFB3A2a95a2474689AF46dE9Dc13,
0xc20453E1d35dfbA2786e06Ed1182A2843832a071,
0x4ff07344f3dFd516e34F2dE4a62C75d5d841eBd0,
0x7637135BE6848c9FA8b4aa7829EE9642feF14aBd,
0x324F2C0d9166ABe080d42a05a5E5747e4106FeDA,
0x26C88d2DFA3f0c94CcA11d93161403E27A7CB479,
0x7EdD3E2c5218d2bBc7C04266e1065cC1f0D56F5D,
0xB97bfc197c3D4aD849aeF2836E4932B36097da36,
0xd5c8f407f7da411fd9AA0AaB5EEEc5650a43a3AD,
0x6545618d31a0548F02f97fe0162F5a4aD1890425,
0x78d1f9e87b323854F68bcf81f9Beafe5a6dAf929,
0x80Fad6d8B77d8e3734c8C84ac153EAe932356B99,
0x9070dbEa5a1248844f4Da8131bc73e2d4042eB6d,
0x0240F5d9B3C38b5f410EF119Beb2261d93480Bf5,
0xb87b26b08B1E507fDcE045AC9Edb9b1d48A8aD50,
0xa92CD39d87CE077F2cB5330c6eb4DDC69923D60c,
0x6B23d3D15Ad743911b078C78Ad7d3183EE07E642,
0x92a1C135430F8624328Ca76DE35c4ffe06af197b
    ];
    
    elixorContract.importGenesisPairs(newParents,newChildren);
 
}

}

contract elixor {
    function importGenesisPairs(address[] newParents,address[] newChildren) public;
}