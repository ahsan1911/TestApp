//
//  HomePageModel.swift
//  TestApp
//
//  Created by Mohamed Anas on 21/09/2023.
//

import Foundation

// MARK: - Welcome
struct HomePageModel: Codable {
    let errorString, successString: String
    let validationSuccess: Bool
    let returnRow: ReturnRow
    let list: Bool
    let errorCode, successCode, totalPage: Int
    let formValues: [FormValue]
    let searchRowCount: Int

    enum CodingKeys: String, CodingKey {
        case errorString = "ErrorString"
        case successString = "SuccessString"
        case validationSuccess = "ValidationSuccess"
        case returnRow = "ReturnRow"
        case list = "List"
        case errorCode = "ErrorCode"
        case successCode = "SuccessCode"
        case totalPage = "TotalPage"
        case formValues = "FormValues"
        case searchRowCount = "SEARCH_ROW_COUNT"
    }
}

// MARK: - FormValue
struct FormValue: Codable {
    let key, value, value1, value2: String
    let value3: String

    enum CodingKeys: String, CodingKey {
        case key = "Key"
        case value = "Value"
        case value1 = "Value1"
        case value2 = "Value2"
        case value3 = "Value3"
    }
}

// MARK: - ReturnRow
struct ReturnRow: Codable {
    let banner: [Banner]
    let menu: [Menu]
    let brand: [Brand]
    let newArrivals, bestSellers, naturalProducts, popularCollection: [Banner]

    enum CodingKeys: String, CodingKey {
        case banner = "BANNER"
        case menu = "MENU"
        case brand = "BRAND"
        case newArrivals = "NEW ARRIVALS"
        case bestSellers = "BEST SELLERS"
        case naturalProducts = "Natural Products"
        case popularCollection = "Popular Collection"
    }
}

// MARK: - Banner
struct Banner: Codable {
    let apSectionOrder, banOrder, apRowNum, apImageMnID: Int
    let apImageID: String
    let apImageURL, apArabicImageURL: String
    let apID, apSesID: String?
    let apQty: Int
    let apPrice, apTotal: Int?
    let apGroupID: String?
    let apType: String
    let apItemGpCode, apItemSubCode, apItemCode, apBolsoCode: String?
    let apItemBarcode, apItemGroupName, apItemSubgroupName, apItemName: String?
    let apShortName: String?
    let apNewArrival, apHomeBanner, apBanner: String?
    let apMinQty, apMaxQty: Int?
    let apOldPrice: Int?
    let apNewPrice, apDiscountedPrice: Double?
    let apDiscountedPerc: Int?
    let apPromoPrice: Double?
    let apPromotQty, apAvailActualQty, apAvailDispQty: Int?
    let apAvailLocation: String?
    let apStickerImage: String
    let apKeywords, apItemDesc: String?
    let apCRDt: String?
    let apMake: String?
    let apBrand: String?
    let apStickerText: String?
    let apPrcCode: String?
    let apFlavourStr: String?
    let apSectionID, apBanID: Int?
    let apSectionName: String?
    let apSectionType: String?
    let apSectionColor: String?
    let apArabicSectionName: String?
    let apName, apMultiName: String?
    let apWishlist: String?

    enum CodingKeys: String, CodingKey {
        case apSectionOrder = "AP_SECTION_ORDER"
        case banOrder = "BAN_ORDER"
        case apRowNum = "AP_ROW_NUM"
        case apImageMnID = "AP_IMAGE_MN_ID"
        case apImageID = "AP_IMAGE_ID"
        case apImageURL = "AP_IMAGE_URL"
        case apArabicImageURL = "AP_ARABIC_IMAGE_URL"
        case apID = "AP_ID"
        case apSesID = "AP_SES_ID"
        case apQty = "AP_QTY"
        case apPrice = "AP_PRICE"
        case apTotal = "AP_TOTAL"
        case apGroupID = "AP_GROUP_ID"
        case apType = "AP_TYPE"
        case apItemGpCode = "AP_ITEM_GP_CODE"
        case apItemSubCode = "AP_ITEM_SUB_CODE"
        case apItemCode = "AP_ITEM_CODE"
        case apBolsoCode = "AP_BOLSO_CODE"
        case apItemBarcode = "AP_ITEM_BARCODE"
        case apItemGroupName = "AP_ITEM_GROUP_NAME"
        case apItemSubgroupName = "AP_ITEM_SUBGROUP_NAME"
        case apItemName = "AP_ITEM_NAME"
        case apShortName = "AP_SHORT_NAME"
        case apNewArrival = "AP_NEW_ARRIVAL"
        case apHomeBanner = "AP_HOME_BANNER"
        case apBanner = "AP_BANNER"
        case apMinQty = "AP_MIN_QTY"
        case apMaxQty = "AP_MAX_QTY"
        case apOldPrice = "AP_OLD_PRICE"
        case apNewPrice = "AP_NEW_PRICE"
        case apDiscountedPrice = "AP_DISCOUNTED_PRICE"
        case apDiscountedPerc = "AP_DISCOUNTED_PERC"
        case apPromoPrice = "AP_PROMO_PRICE"
        case apPromotQty = "AP_PROMOT_QTY"
        case apAvailActualQty = "AP_AVAIL_ACTUAL_QTY"
        case apAvailDispQty = "AP_AVAIL_DISP_QTY"
        case apAvailLocation = "AP_AVAIL_LOCATION"
        case apStickerImage = "AP_STICKER_IMAGE"
        case apKeywords = "AP_KEYWORDS"
        case apItemDesc = "AP_ITEM_DESC"
        case apCRDt = "AP_CR_DT"
        case apMake = "AP_MAKE"
        case apBrand = "AP_BRAND"
        case apStickerText = "AP_STICKER_TEXT"
        case apPrcCode = "AP_PRC_CODE"
        case apFlavourStr = "AP_FLAVOUR_STR"
        case apSectionID = "AP_SECTION_ID"
        case apBanID = "AP_BAN_ID"
        case apSectionName = "AP_SECTION_NAME"
        case apSectionType = "AP_SECTION_TYPE"
        case apSectionColor = "AP_SECTION_COLOR"
        case apArabicSectionName = "AP_ARABIC_SECTION_NAME"
        case apName = "AP_NAME"
        case apMultiName = "AP_MULTI_NAME"
        case apWishlist = "AP_WISHLIST"
    }
}


// MARK: - Brand
struct Brand: Codable {
    let banOrder, rowNum, apImageMnID: Int
    let apImageID: String
    let apImageURL, apArabicImageURL: String
    let brandCode, brandID: String
    let brandName: String
    let apID: String

    enum CodingKeys: String, CodingKey {
        case banOrder = "BAN_ORDER"
        case rowNum = "ROW_NUM"
        case apImageMnID = "AP_IMAGE_MN_ID"
        case apImageID = "AP_IMAGE_ID"
        case apImageURL = "AP_IMAGE_URL"
        case apArabicImageURL = "AP_ARABIC_IMAGE_URL"
        case brandCode = "BRAND_CODE"
        case brandID = "BRAND_ID"
        case brandName = "BRAND_NAME"
        case apID = "AP_ID"
    }
}

// MARK: - Menu
struct Menu: Codable {
    let menuImageID: Int
    let menuName, menuMultiName: String
    let menuOrder: Int
    let topMenu: String
    let ecDesc, ecTitle: String?
    let catJSON: [CatJSON]
    let ecBtySol, ecShoCat: String
    let apID: String

    enum CodingKeys: String, CodingKey {
        case menuImageID = "MENU_IMAGE_ID"
        case menuName = "MENU_NAME"
        case menuMultiName = "MENU_MULTI_NAME"
        case menuOrder = "MENU_ORDER"
        case topMenu = "TOP_MENU"
        case ecDesc = "EC_DESC"
        case ecTitle = "EC_TITLE"
        case catJSON = "CAT_JSON"
        case ecBtySol = "EC_BTY_SOL"
        case ecShoCat = "EC_SHO_CAT"
        case apID = "AP_ID"
    }
}

// MARK: - CatJSON
struct CatJSON: Codable {
    let rowNum: Int
    let apItemGpCode, apItemGroupName: String
    let igTopCat: String
    let apArabicItemGroupName: String
    let apImageID: String?
    let apImageURL, apArabicImageURL: String?
    let igIsPromo: String
    let igSequenceNo, menuID: Int
    let catJSONJSONData: String?
    let jsonSubGroupData: String
    let jsonKeywordGroupData: String?
    let igPGTopCat: String

    enum CodingKeys: String, CodingKey {
        case rowNum = "ROW_NUM"
        case apItemGpCode = "AP_ITEM_GP_CODE"
        case apItemGroupName = "AP_ITEM_GROUP_NAME"
        case igTopCat = "IG_TOP_CAT"
        case apArabicItemGroupName = "AP_ARABIC_ITEM_GROUP_NAME"
        case apImageID = "AP_IMAGE_ID"
        case apImageURL = "AP_IMAGE_URL"
        case apArabicImageURL = "AP_ARABIC_IMAGE_URL"
        case igIsPromo = "IG_IS_PROMO"
        case igSequenceNo = "IG_SEQUENCE_NO"
        case menuID = "MENU_ID"
        case catJSONJSONData = "JSON_DATA"
        case jsonSubGroupData = "JSON_SUB_GROUP_DATA"
        case jsonKeywordGroupData = "JSON_KEYWORD_GROUP_DATA"
        case igPGTopCat = "IG_PG_TOP_CAT"
    }
}
