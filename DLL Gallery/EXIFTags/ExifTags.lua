------------------------------[[ SCRIPT: Global Script ]]------------------------------
ExifTags = {};
function ExifTags.Initialize(imageFile)
	DLL.CallFunction("AutoPlay\\Docs\\ExifTags.dll", "Initialize", "\""..imageFile.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function ExifTags.GetTagCount()
	tagCount = DLL.CallFunction("AutoPlay\\Docs\\ExifTags.dll", "GetTagCount", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
	return String.ToNumber(tagCount);
end
function ExifTags.GetTagId(index)
	return DLL.CallFunction("AutoPlay\\Docs\\ExifTags.dll", "GetTagId", index, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function ExifTags.GetTag(index)
	return DLL.CallFunction("AutoPlay\\Docs\\ExifTags.dll", "GetTag", index, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function ExifTags.GetTagType(index)
	return DLL.CallFunction("AutoPlay\\Docs\\ExifTags.dll", "GetTagType", index, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function ExifTags.GetTagValue(index)
	return DLL.CallFunction("AutoPlay\\Docs\\ExifTags.dll", "GetTagValue", index, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function ExifTags.GetTagValueEx(exifTag)
	return DLL.CallFunction("AutoPlay\\Docs\\ExifTags.dll", "GetTagValueEx", exifTag, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function ExifTags.IsKnownTag(tagId)
	return DLL.CallFunction("AutoPlay\\Docs\\ExifTags.dll", "IsKnownTag", tagId, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function ExifTags.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\ExifTags.dll", "GetError", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

ExifTag = {
	Artist = 315,
	Author = 40093,
	BitsPerSample = 258,
	CellHeight = 265,
	CellWidth = 264,
	ChrominanceTable = 20625,
	ColorMap = 320,
	ColorTransferFunction = 20506,
	Comments = 40092,
	Compression = 259,
	Contrast = 41992,
	Copyright = 33432,
	CustomRendered = 41985,
	DateTime = 306,
	DeviceSettingDescription = 41995,
	DigitalZoomRatio = 41988,
	DocumentName = 269,
	DotRange = 336,
	EquipMake = 271,
	EquipModel = 272,
	ExifAperture = 37378,
	ExifBrightness = 37379,
	ExifCfaPattern = 41730,
	ExifColorSpace = 40961,
	ExifCompBPP = 37122,
	ExifCompConfig = 37121,
	ExifDTDigitized = 36868,
	ExifDTDigSS = 37522,
	ExifDTOrig = 36867,
	ExifDTOrigSS = 37521,
	ExifDTSubsec = 37520,
	ExifExposureBias = 37380,
	ExifExposureIndex = 41493,
	ExifExposureProg = 34850,
	ExifExposureTime = 33434,
	ExifFileSource = 41728,
	ExifFlash = 37385,
	ExifFlashEnergy = 41483,
	ExifFNumber = 33437,
	ExifFocalLength = 37386,
	ExifFocalResUnit = 41488,
	ExifFocalXRes = 41486,
	ExifFocalYRes = 41487,
	ExifFPXVer = 40960,
	ExifIFD = 34665,
	ExifInterop = 40965,
	ExifISOSpeed = 34855,
	ExifLightSource = 37384,
	ExifMakerNote = 37500,
	ExifMaxAperture = 37381,
	ExifMeteringMode = 37383,
	ExifOECF = 34856,
	ExifPixXDim = 40962,
	ExifPixYDim = 40963,
	ExifRelatedWav = 40964,
	ExifSceneType = 41729,
	ExifSensingMethod = 41495,
	ExifShutterSpeed = 37377,
	ExifSpatialFR = 41484,
	ExifSpectralSense = 34852,
	ExifSubjectDist = 37382,
	ExifSubjectLoc = 41492,
	ExifUserComment = 37510,
	ExifVer = 36864,
	ExposureMode = 41986,
	ExtraSamples = 338,
	FillOrder = 266,
	FocalLengthIn35mmFilm = 41989,
	FrameDelay = 20736,
	FreeByteCounts = 289,
	FreeOffset = 288,
	GainControl = 41991,
	Gamma = 769,
	GlobalPalette = 20738,
	GpsAltitude = 6,
	GpsAltitudeRef = 5,
	GPSAreaInformation = 28,
	GPSDateStamp = 29,
	GpsDestBear = 24,
	GpsDestBearRef = 23,
	GpsDestDist = 26,
	GpsDestDistRef = 25,
	GpsDestLat = 20,
	GpsDestLatRef = 19,
	GpsDestLong = 22,
	GpsDestLongRef = 21,
	GPSDifferential = 30,
	GpsGpsDop = 11,
	GpsGpsMeasureMode = 10,
	GpsGpsSatellites = 8,
	GpsGpsStatus = 9,
	GpsGpsTime = 7,
	GpsIFD = 34853,
	GpsImgDir = 17,
	GpsImgDirRef = 16,
	GpsLatitude = 2,
	GpsLatitudeRef = 1,
	GpsLongitude = 4,
	GpsLongitudeRef = 3,
	GpsMapDatum = 18,
	GPSProcessingMethod = 27,
	GpsSpeed = 13,
	GpsSpeedRef = 12,
	GpsTrack = 15,
	GpsTrackRef = 14,
	GpsVer = 0,
	GrayResponseCurve = 291,
	GrayResponseUnit = 290,
	GridSize = 20497,
	HalftoneDegree = 20492,
	HalftoneHints = 321,
	HalftoneLPI = 20490,
	HalftoneLPIUnit = 20491,
	HalftoneMisc = 20494,
	HalftoneScreen = 20495,
	HalftoneShape = 20493,
	HostComputer = 316,
	ICCProfile = 34675,
	ICCProfileDescriptor = 770,
	ImageDescription = 270,
	ImageHeight = 257,
	ImageTitle = 800,
	ImageUniqueID = 42016,
	ImageWidth = 256,
	IndexBackground = 20739,
	IndexTransparent = 20740,
	InkNames = 333,
	InkSet = 332,
	JPEGACTables = 521,
	JPEGDCTables = 520,
	JPEGInterFormat = 513,
	JPEGInterLength = 514,
	JPEGLosslessPredictors = 517,
	JPEGPointTransforms = 518,
	JPEGProc = 512,
	JPEGQTables = 519,
	JPEGQuality = 20496,
	JPEGRestartInterval = 515,
	Keywords = 40094,
	LoopCount = 20737,
	LuminanceTable = 20624,
	MaxSampleValue = 281,
	MinSampleValue = 280,
	NewSubfileType = 254,
	NumberOfInks = 334,
	Orientation = 274,
	PageName = 285,
	PageNumber = 297,
	PaletteHistogram = 20755,
	PhotometricInterp = 262,
	PixelPerUnitX = 20753,
	PixelPerUnitY = 20754,
	PixelUnit = 20752,
	PlanarConfig = 284,
	Predictor = 317,
	PrimaryChromaticities = 319,
	PrintFlags = 20485,
	PrintFlagsBleedWidth = 20488,
	PrintFlagsBleedWidthScale = 20489,
	PrintFlagsCrop = 20487,
	PrintFlagsVersion = 20486,
	REFBlackWhite = 532,
	RelatedImageLength = 4097,
	ResolutionUnit = 296,
	ResolutionXLengthUnit = 20483,
	ResolutionXUnit = 20481,
	ResolutionYLengthUnit = 20484,
	ResolutionYUnit = 20482,
	RowsPerStrip = 278,
	SampleFormat = 339,
	SamplesPerPixel = 277,
	Saturation = 41993,
	SceneCaptureType = 41990,
	Sharpness = 41994,
	SMaxSampleValue = 341,
	SMinSampleValue = 340,
	SoftwareUsed = 305,
	SRGBRenderingIntent = 771,
	StripBytesCount = 279,
	StripOffsets = 273,
	SubfileType = 255,
	Subject = 40095,
	SubjectArea = 37396,
	SubjectDistanceRange = 41996,
	T4Option = 292,
	T6Option = 293,
	TargetPrinter = 337,
	ThreshHolding = 263,
	ThumbnailArtist = 20532,
	ThumbnailBitsPerSample = 20514,
	ThumbnailColorDepth = 20501,
	ThumbnailCompressedSize = 20505,
	ThumbnailCompression = 20515,
	ThumbnailCopyRight = 20539,
	ThumbnailData = 20507,
	ThumbnailDateTime = 20531,
	ThumbnailEquipMake = 20518,
	ThumbnailEquipModel = 20519,
	ThumbnailFormat = 20498,
	ThumbnailHeight = 20500,
	ThumbnailImageDescription = 20517,
	ThumbnailImageHeight = 20513,
	ThumbnailImageWidth = 20512,
	ThumbnailOrientation = 20521,
	ThumbnailPhotometricInterp = 20516,
	ThumbnailPlanarConfig = 20527,
	ThumbnailPlanes = 20502,
	ThumbnailPrimaryChromaticities = 20534,
	ThumbnailRawBytes = 20503,
	ThumbnailRefBlackWhite = 20538,
	ThumbnailResolutionUnit = 20528,
	ThumbnailResolutionX = 20525,
	ThumbnailResolutionY = 20526,
	ThumbnailRowsPerStrip = 20523,
	ThumbnailSamplesPerPixel = 20522,
	ThumbnailSize = 20504,
	ThumbnailSoftwareUsed = 20530,
	ThumbnailStripBytesCount = 20524,
	ThumbnailStripOffsets = 20520,
	ThumbnailTransferFunction = 20529,
	ThumbnailWhitePoint = 20533,
	ThumbnailWidth = 20499,
	ThumbnailYCbCrCoefficients = 20535,
	ThumbnailYCbCrPositioning = 20537,
	ThumbnailYCbCrSubsampling = 20536,
	TileByteCounts = 325,
	TileLength = 323,
	TileOffset = 324,
	TileWidth = 322,
	Title = 40091,
	TransferFunction = 301,
	TransferRange = 342,
	WhiteBalance = 41987,
	WhitePoint = 318,
	XPosition = 286,
	XResolution = 282,
	YCbCrCoefficients = 529,
	YCbCrPositioning = 531,
	YCbCrSubsampling = 530,
	YPosition = 287,
	YResolution = 283
};


------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetTags2, Event: On Click Script ]]------------------------------
imageFile = Dialog.FileBrowse(true, "Locate File", _DesktopFolder, "Image Files (.bmp, .jpg, .png)|*.bmp;*.jpg;*.png.", "", "dat", false, false)[1];
if (imageFile ~= "CANCEL") then
	ExifTags.Initialize(imageFile);
	
	equipMake = ExifTags.GetTagValueEx(ExifTag.EquipMake);
	equipModel = ExifTags.GetTagValueEx(ExifTag.EquipModel);
	xResolution = ExifTags.GetTagValueEx(ExifTag.XResolution);
	yResolution = ExifTags.GetTagValueEx(ExifTag.YResolution);

	ListBox.AddItem("ListBox1", "EquipMake".." - "..equipMake, "");
	ListBox.AddItem("ListBox1", "EquipModel".." - "..equipModel, "");
	ListBox.AddItem("ListBox1", "XResolution".." - "..xResolution, "");
	ListBox.AddItem("ListBox1", "YResolution".." - "..yResolution, "");
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetTags, Event: On Click Script ]]------------------------------
imageFile = Dialog.FileBrowse(true, "Locate File", _DesktopFolder, "Image Files (.bmp, .jpg, .png)|*.bmp;*.jpg;*.png.", "", "dat", false, false)[1];
if (imageFile ~= "CANCEL") then
	ExifTags.Initialize(imageFile);
	tagCount = ExifTags.GetTagCount();

	for i = 0, tagCount - 1 do
		tag = ExifTags.GetTag(i);
		tagValue = ExifTags.GetTagValue(i);
		ListBox.AddItem("ListBox1", tag.." - "..tagValue, "");
	end
end

