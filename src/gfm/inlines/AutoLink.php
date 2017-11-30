<?hh // strict
/*
 *  Copyright (c) 2004-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the BSD-style license found in the
 *  LICENSE file in the root directory of this source tree. An additional grant
 *  of patent rights can be found in the PATENTS file in the same directory.
 *
 */

namespace Facebook\GFM\Inlines;

use namespace HH\Lib\Str;

final class AutoLink extends Inline {
  public function __construct(
    private string $text,
    private string $destination,
  ) {
  }

  public function getText(): string {
    return $this->text;
  }

  public function getDestination(): string {
    return $this->destination;
  }

  public function getContentAsPlainText(): string {
    return $this->text;
  }

  public static function consume(
    Context $_,
    string $_previous,
    string $string,
  ): ?(Inline, string, string) {
    if ($string[0] !== '<') {
      return null;
    }

    $end = Str\search($string, '>');
    if ($end === null) {
      return null;
    }

    $uri = Str\slice($string, 1, $end - 1);
    if (\preg_match('/^[a-z][a-z0-9:=.-]{1,31}:[^<> ]*$/i', $uri) !== 1) {
      // TODO: handle email autolinks
      return null;
    }

    return tuple(
      new self($uri, $uri),
      $string[$end],
      Str\slice($string, $end + 1),
    );
  }
}
