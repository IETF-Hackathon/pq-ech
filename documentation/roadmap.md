## Encrypted Client Hello - Roadmap

### Preliminaries

##### Open-source projects that we are using: 
1) [wolfSSL](https://github.com/wolfSSL/wolfssl) as our TLS 1.3 library and our cryptography engine
2) [liboqs](https://github.com/open-quantum-safe/liboqs) for post-quantum algorithm implementations

##### Programming language:
Both libraries that we are using are written in C. All the edits in order to use PQ algorithms in ECH are going to be done in wolfSSL C code.

##### IDE 
We are using Eclipse CDT IDE in order to browse through the wolfSSL C code. 
The Vagrant files setup a minimal Ubuntu VM with Gnome GUI and Eclipse CDT installed in order for a newcomer to be able to edit the code immediately from the same starting point.
Otherwise, there is a Vagrant installation that enables someone to edit the wolfSSL code from any text editor/IDE that is already setup in the host machine.
Keep in mind that in that case, debugging the code would be impossible as some dependencies will be linked to the guest machine.

### Step 1 - HPKE Roadmap
The first thing we have to do is to “tweak” HPKE to use post-quantum algorithms.

1) Now the first thing we have to do is to write a testbed of a HPKE Seal-Open operations to test all the changes we will make. We will provide this file with all the necessary modifications in order to speed up the development process.

2) Now that we have a baseline to test our changes we can change the appropriate files that implement the HPKE in wolfssl in order to use PQ algorithms.

Files that needs to be modified:
`wolfcrypt/src/hpke.c`

3) We need to include a Kyber "case" in all of the HPKE API functions that have KEM related operations in them:
```
wc_HpkeInit()
wc_HpkeGenerateKeyPair()
wc_HpkeSerializePublicKey()
wc_HpkeDeserializePublicKey()
wc_HpkeFreeKey()
wc_HpkeEncap() ##(I used no context)
wc_HpkeDecap()
```

4) Now we have to introduce new HPKE KEM codepoints. Also new Macros that are extensively used, e.g `KEM_KYBER512_ENC_LEN`. Also some MAX sizes that will eventually throw errors, e.g `HPKE_Npk_MAX` or `MAX_HPKE_LABEL_SZ`.

Files that needs to be modified: `wolfcrypt/src/hpke.h`

5) Regarding PQ algorithms, we must include :
```
#include <wolfssl/wolfcrypt/kyber.h>
#include <wolfssl/wolfcrypt/ext_kyber.h>
```

So now we can use the Kyber API and all the Kyber Defines.

### Step 2 - ECH roadmap

Now we have a complete PQ-HPKE up and running. We can go on and continue with the rest of the code.

1) The first thing that we have to do is to have a testbed of a TLS 1.3 with ECH handshake.
We will use an ECH client and server example from wolfssl-examples repository.
We can combine the code of these two to make a single program that will switch between server and client with
 a user indicated switch (-c and -s). Now we can compile and test the ECH exchange locally in the same machine.
	
 Files that need to be modified:
 
```
/examples/benchmark/tls_bench.c
/examples/benchmark/tls_bench.h
```

We can comment out everything and include our code (simpler than tweaking the Makefile
hierarchy and introducing a new executable program)

2) Now we can modify the server to use PQ HPKE to generate ECH Configs (this may work as is, can't remember…)

3) Now we can start the modifications on the ECH part of the handshake

Files that (probably) need to be modified:

```
/src/tls.c
10439 TLSX_GreaseECH_Use
TLSX_ECH_Use
TLSX_ServerECH_Use
TLSX_ECH_Write
TLSX_ECH_GetSize
TLSX_ExtractEch
TLSX_ECH_Parse
TLSX_ECH_Free
TLSX_FinalizeEch
```

