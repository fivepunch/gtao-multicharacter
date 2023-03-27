function encodeQBCoreAppearance(appearance)
    local function getHeadOverlayStyleValue(value)
        return value ~= 0 and value or -1
    end

    local function getHeadOverlayColorValue(value)
        return value ~= nil and value or 0
    end

    local componentIdToName = {
        [1] = 'mask',
        [3] = 'arms',
        [4] = 'pants',
        [5] = 'bag',
        [6] = 'shoes',
        [7] = 'accessory',
        [8] = 't-shirt',
        [9] = 'vest',
        [10] = 'decals',
        [11] = 'torso2',
    }

    local propIdToName = {
        [0] = 'hat',
        [1] = 'glass',
        [2] = 'ear',
        [6] = 'watch',
        [7] = 'bracelet',
    }

    local model = appearance.model and GetHashKey(appearance.model) or `mp_m_freemode_01`

    local data = {}

    data['face'] = { item = appearance.headBlend.shapeFirst, texture = appearance.headBlend.skinFirst }
    data['face2'] = { item = appearance.headBlend.shapeSecond, texture = appearance.headBlend.skinSecond }
    data['facemix'] = { shapeMix = appearance.headBlend.shapeMix, skinMix = appearance.headBlend.skinMix }

    data['nose_0'] = { item = appearance.faceFeatures.noseWidth }
    data['nose_1'] = { item = appearance.faceFeatures.nosePeakHigh }
    data['nose_2'] = { item = appearance.faceFeatures.nosePeakSize }
    data['nose_3'] = { item = appearance.faceFeatures.noseBoneHigh }
    data['nose_4'] = { item = appearance.faceFeatures.nosePeakLowering }
    data['nose_5'] = { item = appearance.faceFeatures.noseBoneTwist }
    data['eyebrown_high'] = { item = appearance.faceFeatures.eyeBrownHigh }
    data['eyebrown_forward'] = { item = appearance.faceFeatures.eyeBrownForward }
    data['cheek_1'] = { item = appearance.faceFeatures.cheeksBoneHigh }
    data['cheek_2'] = { item = appearance.faceFeatures.cheeksBoneWidth }
    data['cheek_3'] = { item = appearance.faceFeatures.cheeksWidth }
    data['eye_opening'] = { item = appearance.faceFeatures.eyesOpening }
    data['lips_thickness'] = { item = appearance.faceFeatures.lipsThickness }
    data['jaw_bone_width'] = { item = appearance.faceFeatures.jawBoneWidth }
    data['jaw_bone_back_lenght'] = { item = appearance.faceFeatures.jawBoneBackSize }
    data['chimp_bone_lowering'] = { item = appearance.faceFeatures.chinBoneLowering }
    data['chimp_bone_lenght'] = { item = appearance.faceFeatures.chinBoneLenght }
    data['chimp_bone_width'] = { item = appearance.faceFeatures.chinBoneSize }
    data['chimp_hole'] = { item = appearance.faceFeatures.chinHole }
    data['neck_thikness'] = { item = appearance.faceFeatures.neckThickness }

    data['blemishes'] = {
        item = getHeadOverlayStyleValue(appearance.headOverlays.blemishes.style),
        texture = getHeadOverlayColorValue(appearance.headOverlays.blemishes.color),
    }
    data['beard'] = {
        item = getHeadOverlayStyleValue(appearance.headOverlays.beard.style),
        texture = getHeadOverlayColorValue(appearance.headOverlays.beard.color),
    }
    data['eyebrows'] = {
        item = getHeadOverlayStyleValue(appearance.headOverlays.eyebrows.style),
        texture = getHeadOverlayColorValue(appearance.headOverlays.eyebrows.color),
    }
    data['ageing'] = {
        item = getHeadOverlayStyleValue(appearance.headOverlays.ageing.style),
        texture = getHeadOverlayColorValue(appearance.headOverlays.ageing.color),
    }
    data['makeup'] = {
        item = getHeadOverlayStyleValue(appearance.headOverlays.makeUp.style),
        texture = getHeadOverlayColorValue(appearance.headOverlays.makeUp.color),
    }
    data['blush'] = {
        item = getHeadOverlayStyleValue(appearance.headOverlays.blush.style),
        texture = getHeadOverlayColorValue(appearance.headOverlays.blush.color),
    }
    data['complexion'] = {
        item = getHeadOverlayStyleValue(appearance.headOverlays.complexion.style),
        texture = getHeadOverlayColorValue(appearance.headOverlays.complexion.color),
    }
    data['sundamage'] = {
        item = getHeadOverlayStyleValue(appearance.headOverlays.sunDamage.style),
        texture = getHeadOverlayColorValue(appearance.headOverlays.sunDamage.color),
    }
    data['lipstick'] = {
        item = getHeadOverlayStyleValue(appearance.headOverlays.lipstick.style),
        texture = getHeadOverlayColorValue(appearance.headOverlays.lipstick.color),
    }
    data['moles'] = {
        item = getHeadOverlayStyleValue(appearance.headOverlays.moleAndFreckles.style),
        texture = getHeadOverlayColorValue(appearance.headOverlays.moleAndFreckles.color),
    }
    data['chesthair'] = {
        item = getHeadOverlayStyleValue(appearance.headOverlays.chestHair.style),
        texture = getHeadOverlayColorValue(appearance.headOverlays.chestHair.color),
    }
    data['bodyblemishes'] = {
        item = getHeadOverlayStyleValue(appearance.headOverlays.bodyBlemishes.style),
        texture = getHeadOverlayColorValue(appearance.headOverlays.bodyBlemishes.color),
    }

    data['hair'] = {
        item = appearance.hair.style,
        texture = appearance.hair.color,
    }

    for _, component in pairs(appearance.components) do
        if componentIdToName[component.component_id] then
            data[componentIdToName[component.component_id]] = {
                item = component.drawable,
                texture = component.texture,
            }
        end
    end

    for _, prop in pairs(appearance.props) do
        if propIdToName[prop.prop_id] then
            data[propIdToName[prop.prop_id]] = {
                item = prop.drawable,
                texture = prop.texture,
            }
        end
    end

    data['eye_color'] = {
        item = appearance.eyeColor
    }

    return model, data
end

function decodeQBCoreAppearance(data)
    local function getHeadOverlayOpacity(value)
        return value ~= -1 and 1.0 or 0.0
    end

    local appearance = {}

    appearance.headBlend = {
        shapeFirst = data['face'].item,
        skinFirst = data['face'].texture,
        shapeSecond = data['face2'].item,
        skinSecond = data['face2'].texture,
        shapeMix = data['facemix'].shapeMix,
        skinMix = data['facemix'].skinMix,
    }

    appearance.faceFeatures = {
        noseWidth = data.nose_0.item,
        nosePeakHigh = data.nose_1.item,
        nosePeakSize = data.nose_2.item,
        noseBoneHigh = data.nose_3.item,
        nosePeakLowering = data.nose_4.item,
        noseBoneTwist = data.nose_5.item,
        eyeBrownHigh = data.eyebrown_high.item,
        eyeBrownForward = data.eyebrown_forward.item,
        cheeksBoneHigh = data.cheek_1.item,
        cheeksBoneWidth = data.cheek_2.item,
        cheeksWidth = data.cheek_3.item,
        eyesOpening = data.eye_opening.item,
        lipsThickness = data.lips_thickness.item,
        jawBoneWidth = data.jaw_bone_width.item,
        jawBoneBackSize = data.jaw_bone_back_lenght.item,
        chinBoneLowering = data.chimp_bone_lowering.item,
        chinBoneLenght = data.chimp_bone_lenght.item,
        chinBoneSize = data.chimp_bone_width.item,
        chinHole = data.chimp_hole.item,
        neckThickness = data.neck_thikness.item,
    }

    appearance.headOverlays = {
        blemishes = {
            style = 0,
            color = 0,
            secondColor = 0,
            opacity = 0.0,
        },
        beard = {
            style = data['beard'].item,
            color = data['beard'].texture,
            secondColor = 0,
            opacity = getHeadOverlayOpacity(data['beard']),
        },
        eyebrows = {
            style = data['eyebrows'].item,
            color = data['eyebrows'].texture,
            secondColor = 0,
            opacity = getHeadOverlayOpacity(data['eyebrows'].item),
        },
        ageing = {
            style = data['ageing'].item,
            color = data['ageing'].texture,
            secondColor = 0,
            opacity = getHeadOverlayOpacity(data['ageing'].item),
        },
        makeUp = {
            style = data['makeup'].item,
            color = data['makeup'].texture,
            secondColor = 0,
            opacity = getHeadOverlayOpacity(data['makeup'].item),
        },
        blush = {
            style = data['blush'].item,
            color = data['blush'].texture,
            secondColor = 0,
            opacity = getHeadOverlayOpacity(data['blush'].item),
        },
        complexion = {
            style = 0,
            color = 0,
            secondColor = 0,
            opacity = 0.0,
        },
        sunDamage = {
            style = 0,
            color = 0,
            secondColor = 0,
            opacity = 0.0,
        },
        lipstick = {
            style = data['lipstick'].item,
            color = data['lipstick'].texture,
            secondColor = 0,
            opacity = getHeadOverlayOpacity(data['lipstick'].item),
        },
        moleAndFreckles = {
            style = data['moles'].item,
            color = data['moles'].texture,
            secondColor = 0,
            opacity = getHeadOverlayOpacity(data['moles'].item),
        },
        chestHair = {
            style = 0,
            color = 0,
            secondColor = 0,
            opacity = 0.0,
        },
        bodyBlemishes = {
            style = 0,
            color = 0,
            secondColor = 0,
            opacity = 0.0,
        },
    }

    appearance.hair = {
        style = data['hair'].item,
        color = data['hair'].texture,
        highlight = 0,
    }

    local componentNameToId = {
        ['mask'] = 1,
        ['arms'] = 3,
        ['pants'] = 4,
        ['bag'] = 5,
        ['shoes'] = 6,
        ['accessory'] = 7,
        ['t-shirt'] = 8,
        ['vest'] = 9,
        ['decals'] = 10,
        ['torso2'] = 11,
    }

    appearance.components = {}

    for componentName, componentId in pairs(componentNameToId) do
        table.insert(appearance.components, {
            component_id = componentId,
            drawable = data[componentName].item,
            texture = data[componentName].texture,
        })
    end

    local propNameToId = {
        ['hat'] = 0,
        ['glass'] = 1,
        ['ear'] = 2,
        ['watch'] = 6,
        ['bracelet'] = 7,
    }

    appearance.props = {}

    for propName, propId in pairs(propNameToId) do
        table.insert(appearance.props, {
            prop_id = propId,
            drawable = data[propName].item,
            texture = data[propName].texture,
        })
    end

    appearance.eyeColor = data.eye_color.item

    return appearance
end

function encodeESXAppearance(appearance)
end

function decodeESXAppearance(data)
end
