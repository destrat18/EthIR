
/* pragma solidity ^0.4.19; */

/* contract Sum { */

/* // uint sol = 0; */
/* // uint[] b; */
/* // uint[] c; */
/* // uint[] s1; */
/* // string[] mis; */
/* // //uint minBetSize = 0.5 ether; */

/* // // function joinPot(uint minBetSize) public payable { */
/* // //         uint tickets = 0; */
/* // //         if (minBetSize > 0){ */
/* // //                 for(uint i = 20; i >= minBetSize; i-= minBetSize) { */
/* // //                     tickets++; */
/* // //         } */
/* // // } */
/* // // } */

/* // function suma2 () { */

/* //     for(uint i = 0; i < b.length; i++){ */
/* //         for (uint j = 0; j< b.length; j++){ */
/* //             sol = sol+11;} */
/* //             } */
/* // //   hola(); */
/* // //   adios(10); */
   
/* // } */


/* // // function suma (uint c, bytes[] a) internal { */
/* // //     uint sol = 0; */
/* // //     bytes[] memory b = a; */
/* // //     for(uint i = 0; i < b.length; i++) */
/* // //             sol = sol+11; */
/* // // //   hola(); */
/* // // //   adios(10); */
   
/* // // } */

/* // // function suma1 () { */
/* // //     uint sol = 0; */
/* // //     for(uint i = 0; i < s1.length; i++){ */
/* // //             sol = sol+11; */
/* // //             for(uint j = 0; j < mis.length; j++){ */
/* // //                      sol = sol+10;} */

/* // // } */
/* // // //   hola(); */
/* // // //   adios(10); */
   
/* // // } */


/* // // function dos (string a) { //longitud de un string */
/* // //    uint sol = 0; */
/* // //    bytes memory b = bytes(a); */
/* // //    uint l = b.length; */
/* // //  //  string[] memory b = a; */
/* // //    for(uint i = 0; i < b.length; i++) */
/* // //             sol = sol+11; */
/* // // } */

/* // // function strCompare(string _a, string _b) returns (int) { */
/* // //         bytes memory a = bytes(_a); */
/* // //         bytes memory b = bytes(_b); */
/* // //         uint minLength = a.length; */
/* // //         if (b.length < minLength) minLength = b.length; */
/* // //         for (uint i = 0; i < minLength; i ++) */
/* // //             if (a[i] < b[i]) */
/* // //                 return -1; */
/* // //             else if (a[i] > b[i]) */
/* // //                 return 1; */
/* // //         if (a.length < b.length) */
/* // //             return -1; */
/* // //         else if (a.length > b.length) */
/* // //             return 1; */
/* // //         else */
/* // //             return 0; */
/* // //     } */

/* // // function stra2cbor(string[] arr)internal returns (bytes) { */
/* // //             uint arrlen = arr.length; */

/* // //             // get correct cbor output length */
/* // //             uint outputlen = 0; */
/* // //             bytes[] memory elemArray = new bytes[](arrlen); */
/* // //             for (uint i = 0; i < arrlen; i++) { */
/* // //                 elemArray[i] = (bytes(arr[i])); */
/* // //                 outputlen += elemArray[i].length + (elemArray[i].length - 1)/23 + 3; //+3 accounts for paired identifier types */
/* // //             } */
/* // //             uint ctr = 0; */
/* // //             uint cborlen = arrlen + 0x80; */
/* // //             outputlen += byte(cborlen).length; */
/* // //             bytes memory res = new bytes(outputlen); */

/* // //             while (byte(cborlen).length > ctr) { */
/* // //                 res[ctr] = byte(cborlen)[ctr]; */
/* // //                 ctr++; */
/* // //             } */
/* // //             for (i = 0; i < arrlen; i++) { */
/* // //                 res[ctr] = 0x5F; */
/* // //                 ctr++; */
/* // //                 for (uint x = 0; x < elemArray[i].length; x++) { */
/* // //                     // if there's a bug with larger strings, this may be the culprit */
/* // //                     if (x % 23 == 0) { */
/* // //                         uint elemcborlen = elemArray[i].length - x >= 24 ? 23 : elemArray[i].length - x; */
/* // //                         elemcborlen += 0x40; */
/* // //                         uint lctr = ctr; */
/* // //                         while (byte(elemcborlen).length > ctr - lctr) { */
/* // //                             res[ctr] = byte(elemcborlen)[ctr - lctr]; */
/* // //                             ctr++; */
/* // //                         } */
/* // //                     } */
/* // //                     res[ctr] = elemArray[i][x]; */
/* // //                     ctr++; */
/* // //                 } */
/* // //                 res[ctr] = 0xFF; */
/* // //                 ctr++; */
/* // //             } */
/* // //             return res; */
/* // //         } */

/* // // function prueba(string a){ */
/* // //      string[] memory b = new string[](3); */
/* // //      b[0] = a; */
/* // //      b[1] = a; */
/* // //      b[2] = a; */
/* // //      stra2cbor(b); */
/* // // } */



/* } */


pragma solidity ^0.4.11;

contract Sum {

function suma () returns (uint sol) {
   sol = 0;
   for(uint i = 0; i < 5; i++)
           sol = sol+11;
   hola();
   adios(10);
 }

function hola() {
   uint i = 0;
   i = i+15;
   }

function adios(uint m) {
   uint c = 14;
   c = c+m;
   comer(c);
}

function comer(uint x) {
   x = x*x;
   hola();
}

}

