# frozen_string_literal: true

require "test_helper"

class PrimerButtonComponentTest < Minitest::Test
  include Primer::ComponentTestHelpers

  def test_renders_content
    render_inline(Primer::ButtonComponent.new) { "content" }

    assert_text("content")
  end

  def test_defaults_button_tag_with_scheme
    render_inline(Primer::ButtonComponent.new) { "content" }

    assert_selector("button.btn[type='button']")
  end

  def test_renders_a_as_a_button
    render_inline(Primer::ButtonComponent.new(tag: :a)) { "content" }

    assert_selector("a.btn[role='button']")
  end

  def test_renders_href
    render_inline(Primer::ButtonComponent.new(href: "www.example.com")) { "content" }

    assert_selector("button[href='www.example.com']")
  end

  def test_renders_buttons_as_a_group_item
    render_inline(Primer::ButtonComponent.new(group_item: true)) { "content" }

    assert_selector("button.btn.BtnGroup-item")
  end

  def test_falls_back_when_type_isn_t_valid
    without_fetch_or_fallback_raises do
      render_inline(Primer::ButtonComponent.new(scheme: :invalid)) { "content" }

      assert_selector(".btn")
    end
  end

  def test_renders_with_the_css_class_mapping_to_the_provided_type
    render_inline(Primer::ButtonComponent.new(scheme: :primary)) { "content" }

    assert_selector(".btn.btn-primary")
  end

  def test_falls_back_when_variant_isn_t_valid
    without_fetch_or_fallback_raises do
      render_inline(Primer::ButtonComponent.new(variant: :invalid)) { "content" }

      assert_selector(".btn")
    end
  end

  def test_renders_with_the_css_class_variant_mapping_to_the_provided_variant
    render_inline(Primer::ButtonComponent.new(variant: :small)) { "content" }

    assert_selector(".btn.btn-sm")
  end
end
