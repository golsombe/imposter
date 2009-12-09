module Imposter
  # Based on Faker::Lorem
  class Animal
    Animals = %w(aardvark anteater argali badger beaver budgerigar burro cat chimpanzee coati cow deer donkey dugong ermine finch gazelle gnu grizzly bear hamster hippopotamus ibex jaguar kinkajou lamb lizard mandrill mink moose musk deer mynah bird opossum ox parrot polar bear prairie dog quagga rat roebuck shrew snake steer turtle waterbuck wolf yak addax antelope armadillo basilisk bighorn buffalo camel chameleon chinchilla colt coyote dingo dormouse eland ewe fish gemsbok goat ground hog hare hog iguana jerboa kitten lemur llama mare mole mountain goat musk-ox newt orangutan panda peccary pony pronghorn rabbit reindeer salamander silver fox springbok tapir vicuna weasel wolverine zebra alligator aoudad ass bat bison bull canary chamois chipmunk cony crocodile doe dromedary elephant fawn fox gila monster gopher guanaco hartebeest horse impala kangaroo koala leopard lovebird marmoset mongoose mouse muskrat ocelot oryx panther pig porcupine puma raccoon reptile seal skunk squirrel tiger walrus whale wombat zebu alpaca ape baboon bear boar bunny capybara cheetah civet cougar crow dog duckbill elk ferret frog giraffe gorilla guinea pig hedgehog hyena jackal kid koodoo lion lynx marten monkey mule mustang okapi otter parakeet platypus porpoise puppy ram rhinoceros sheep sloth stallion toad warthog wildcat woodchuck)

    def self.one(num = 1)
      Animals.shuffle[0, num]
    end

    def self.multiple(word_count = 2)
      one(word_count).join(' ').capitalize
    end
  end
end
