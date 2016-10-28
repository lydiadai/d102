module FlashHelper
  FLASH_CLASSES = { alert :"danger", notice :"success", warning :"warning"}

  def flash_classes(key)
    FLASH_CLASSES.fetch key.to_sym, key
  end

  def user_facing_flashes
    flash.to_hash.slice "alert","notice","warning"
  end

end
