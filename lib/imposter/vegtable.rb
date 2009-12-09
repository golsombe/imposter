module Imposter
  # Based on Faker::Lorem
  class Vegtable
    Vegtables = %w(Achoccha Amaranth Angelica Anise Arrowroot Arrugula Artichoke Asparagus Apple Balsam\sPear Bambara Bamboo Beans Beet Bok Choy Boniato Broccoli Brussels sprouts Burdock Cabbage Chinese Cabbage Kale Swamp Cabbage Calabaza Cantaloupes Capers Cardoon Carrot Cassava Celeriac Celery Celtuce Chard Chaya Chayote Chicory Chives Chrysanthemum Chufa Cilantro Citron Collards Comfrey Corn salad Corn Cuban Sweet Potato Cucmber Cushcush Daikon Dandelion Dasheen Dill Eggplant Endive Fennel Galia Muskmelon Garbanzo Garlic Gherkin Ginger Ginseng Gourds Guar Hanover Salad Horseradish Horseradish tree Huckleberry Ice Plant Jicama Jojoba Kale Kangkong Kohlrabi Leek Lentils Lettuce Lovage Luffa Gourd Malanga Martynia Casaba Melon  Honeydew Melon  Momordica Mushroom Cantaloupe Mustard collard Mustard potherb Naranjillo Nasturtium Okra Onion Orach Paprika Parsley Parsley root Parsnip Peas Peanut Pepper Pimiento Pokeweed Potato Sweet potato Pumpkin Purslane Radicchio Radish Radish Chinese Rakkyo Rampion Rape and Canola Rhubarb Romaine Lettuce Roselle Rutabaga Saffron Salsify Sarsaparilla Sassafrass Scorzonera Sea kale Shallot Skirret Smallage Sorrel garden Southern pea Soybeans Spinach Spinach Squash Strawberries Swamp Cabbage Sweet Basil Sweet Corn Sweet potato Swiss Chard Tomatillo Tomato Tomato husk Tomato tree Truffles Upland cress Water celery Waterchestnut Watercress Watermelon Yams)

    def self.one(num = 1)
      Vegtables.shuffle[0, num]
    end

    def self.multiple(word_count = 2)
      one(word_count).join( ).capitalize
    end

    def self.at(num=0)
	Vegtables[num]
    end
  end
end
