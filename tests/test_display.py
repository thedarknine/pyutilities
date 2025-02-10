"""Test to check display utilities."""

import arrow
from pyutilities_thedarknine.display import (
    info, alert, title, items_list, clear_screen, start_info, end_info
)


def test_info():
    """Test info."""
    info("Test info")


def test_alert():
    """Test alert."""
    alert("Test alert")


def test_title():
    """Test title."""
    title("Test title")


def test_items_list():
    """Test items list."""
    items_list(["Test item 1", "Test item 2", "Test item 3"])
    items_list([])
    items_list(None)
    items_list("")
    items_list(1)


def test_clear_screen():
    """Test clear screen."""
    clear_screen()


def test_start_info():
    """Test start info."""
    start_info(arrow.now(), "Test start info")


def test_end_info():
    """Test end info."""
    end_info(arrow.now())