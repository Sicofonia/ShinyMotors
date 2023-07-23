classdef (Abstract) ICardReaderAdapter
    %ICARDREADER Interface that defines operations available for a card
    %reader   
    methods
        card = readCard(~)
    end
end

