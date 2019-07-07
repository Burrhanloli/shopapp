import 'package:flutter/material.dart';
import 'ThemeColors.dart';

class PageIndicator extends StatelessWidget {
  final int _currentIndex;

  final int _pageCount;

  PageIndicator(this._currentIndex, this._pageCount);

  Widget _indicator(bool isActive) {
    return Expanded(
      child: Container(
          height: isActive ? 18.0 : 15,
          width: isActive ? 18.0 : 15,
          decoration: BoxDecoration(
              color: isActive ? ksecondaryDarkColor : Colors.grey,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: isActive
                        ? ksecondaryDarkColor.withOpacity(0.9)
                        : Colors.black12,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 10.0)
              ])),
    );
  }

  _buildIndicator() {
    List<Widget> indicatorList = [];
    for (int i = 0; i < _pageCount; i++) {
      indicatorList
          .add(i == _currentIndex ? _indicator(true) : _indicator(false));
    }
    return indicatorList;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildIndicator(),
    );
  }
}

class ChipForMaterials extends StatelessWidget {
  int _currentIndex = 0;
  final _isSmall;
  final List<String> _materialNames;

  ChipForMaterials(this._isSmall, this._materialNames);

  Widget _materialChips() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: _isSmall
            ? Chip(
                label: Text(
                _materialNames[_currentIndex],
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w900,
                ),
              ))
            : Padding(
                padding: EdgeInsets.all(-0.0),
                child: ListTile(
                  leading: Icon(
                    Icons.arrow_right,
                    size: 30,
                  ),
                  title: Text(
                    _materialNames[_currentIndex],
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  _buildMaterialChips() {
    List<Widget> indicatorList = [];
    for (int i = 0; i < (_isSmall ? 3 : _materialNames.length); i++) {
      indicatorList.add(_materialChips());
      _currentIndex++;
    }
    indicatorList.add(etcChip());
    return indicatorList;
  }

  Widget etcChip() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _isSmall
            ? Text(
                "more...",
                style: TextStyle(
                  color: ksecondaryDarkColor,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w900,
                ),
              )
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _isSmall
        ? ListView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            children: _buildMaterialChips(),
          )
        : ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: _buildMaterialChips(),
          );
  }
}
