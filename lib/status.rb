module Game
  class Status
    attr_reader :duration, :tic_func, :init_func, :expire_func, :attack_func, :damaged_func, :cleance_func

    def initialize(duration, tic_func, init_func, expire_func, attack_func, damaged_func, cleance_func)
      @duration = duration
      @tic_func = tic_func
      @init_func = init_func
      @expire_func = expire_func
      @attack_func = attack_func
      @damaged_func = damaged_func
      @cleance_func = cleance_func
    end

    def buff_tic(owner, cur, caster)
      @tic_func.call(target, cur, caster) unless @tic_func == nil
    end

    def buff_init(owner, caster)
      @init_func.call(owner, caster) unless @init_func == nil
    end

    def buff_expire(owner, caster)
      @expire_func.call(owner, caster) unless @expire_func == nil
    end

    def buff_attack(owner, target, caster)
      @attack_func.call(owner, target, caster) unless @attack_func == nil
    end

    def buff_damaged(owner, dealer, caster)
      @damaged_func.call(owner, dealer, caster) unless @damaged_func == nil
    end

    def buff_cleance(owner, caster)
      @cleance_func.call(owner, caster) unless @cleance_func == nil
    end
  end
end
