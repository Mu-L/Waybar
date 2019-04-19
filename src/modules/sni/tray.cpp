#include "modules/sni/tray.hpp"

#include <iostream>

waybar::modules::SNI::Tray::Tray(const std::string& id, const Bar& bar, const Json::Value& config)
    : config_(config),
      box_(bar.vertical ? Gtk::ORIENTATION_VERTICAL : Gtk::ORIENTATION_HORIZONTAL, 0),
      watcher_(),
      host_(nb_hosts_, config, std::bind(&Tray::onAdd, this, std::placeholders::_1),
            std::bind(&Tray::onRemove, this, std::placeholders::_1)) {
  if (config_["spacing"].isUInt()) {
    box_.set_spacing(config_["spacing"].asUInt());
  }
  nb_hosts_ += 1;
}

void waybar::modules::SNI::Tray::onAdd(std::unique_ptr<Item>& item) {
  box_.pack_start(item->event_box);
  dp.emit();
}

void waybar::modules::SNI::Tray::onRemove(std::unique_ptr<Item>& item) {
  box_.remove(item->event_box);
  dp.emit();
}

auto waybar::modules::SNI::Tray::update() -> void {
  if (box_.get_children().size() > 0) {
    box_.set_name("tray");
    box_.show_all();
  } else {
    box_.set_name("");
  }
}

waybar::modules::SNI::Tray::operator Gtk::Widget&() { return box_; }
