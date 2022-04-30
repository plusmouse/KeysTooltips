local realCompose = Auctionator.Search.ComposeTooltip
local LibSerialize = LibStub("LibSerialize")

Auctionator.Search.ComposeTooltip = function(searchTerm)
  if PointBlankSniper.ItemKeyCache.State.orderedKeys == nil then
    PointBlankSniper.ItemKeyCache.State.orderedKeys = select(2, LibSerialize:Deserialize(POINT_BLANK_SNIPER_ITEM_CACHE.orderedKeys))
  end
  local result = realCompose(searchTerm)
  local amount = #PointBlankSniper.Scan.GetItemKeys(PointBlankSniper.Utilities.ConvertList({items = {searchTerm}}))
  table.insert(result.lines, {"Item Keys", amount})
  return result
end
