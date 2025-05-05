local realCompose = Auctionator.Search.ComposeTooltip
local LibSerialize = LibStub("LibSerialize")

local source = {}

Auctionator.Search.ComposeTooltip = function(searchTerm)
  Auctionator.EventBus:RegisterSource(source, "compose tooltip")
      :Fire(source, PointBlankSniper.Events.SetupKeysSearch)
      :UnregisterSource(source)
  local result = realCompose(searchTerm)
  local list = CreateAndInitFromMixin(AuctionatorShoppingListMixin, {items = {searchTerm}}, {})
  local amount = #PointBlankSniper.Scan.GetItemKeys(PointBlankSniper.Utilities.ConvertList(list))
  table.insert(result.lines, {"Item Keys", amount})
  return result
end
