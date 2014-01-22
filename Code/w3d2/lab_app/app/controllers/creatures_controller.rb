 class CreaturesController < ApplicationController
    
    def index
    	@creatures=Creature.all
        render :index
    end

    def new
        render :new
    end

    def create
        params = params[:creature].permit(:name, :description)
        Creature.create(creature)
    	redirect_to "/creatures/#{new_creature.id}"
    end


    def show
        creature_id = params[:id]
        Creature.find(creature_id)
        render :show
    end

    def edit
        creature_id = params[:id]
        Creature.find(creature_id)
        render :edit
    end

    def update
        creature_id = params[:id]
        creature = Creature.find(creature_id)
        updated_attributes = params.require(:creature).permit(:name, :description)
        creature.update_attributes(updated_attributes)
        redirect_to "/creatures/#{creature.id}"

    end



end