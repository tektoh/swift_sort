OSX_VERSION = 10.9
XCODE_VERSION = Xcode6-Beta5
XCODE = /Applications/$(XCODE_VERSION).app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain
SWIFT = $(XCODE)/usr/bin/swift
SWIFTC = $(XCODE)/usr/bin/swiftc
SDKROOT = /Applications/$(XCODE_VERSION).app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX$(OSX_VERSION).sdk

libSortData.dylib: SortData.swiftmodule SortData.swiftdoc SortData.o 
	libtool -macosx_version_min $(OSX_VERSION) \
		-L$(XCODE)/usr/lib/swift/macosx \
		-dynamic \
		-install_name @rpath/libSortData.dylib \
		-lswiftCore \
		-lSystem \
		-o libSortData.dylib \
		SortData.o

SortData.o: SortData.swift
	$(SWIFTC) -emit-library \
		-emit-object SortData.swift \
		-sdk $(SDKROOT) \
		-o SortData.o

SortData.swiftmodule SortData.swiftdoc: SortData.swift
	$(SWIFT) -frontend \
		-emit-module \
		-module-name SortData \
		-emit-module-path SortData.swiftmodule \
		-emit-module-doc-path SortData.swiftdoc \
		-sdk $(SDKROOT) \
		SortData.swift
clean:
	rm -f SortData.swiftmodule　SortData.swiftdoc SortData.o libSortData.dylib
