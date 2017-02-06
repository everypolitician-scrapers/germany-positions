require 'wikisnakker'

module Wikisnakker
  class Politician < Item
    P39_QUALIFIERS = {
      P102:  :party,
      P155:  :follows,
      P156:  :followed_by,
      P194:  :body,
      P580:  :start_date,
      P582:  :end_date,
      P642:  :of,
      P768:  :constituency,
      P1365: :replaces,
      P1366: :replaced_by,
      P2715: :election,
      P2937: :term,
    }.freeze

    def positions
      return [] if self.P39s.empty?
      self.P39s.map do |posn|
        quals = posn.qualifiers
        qdata = quals.properties.partition { |p| P39_QUALIFIERS[p] }
        warn "#{id}: #{posn.value.id} + unknown #{qdata.last.join(', ')}" unless qdata.last.empty?

        qgood = qdata.first.map { |p| [P39_QUALIFIERS[p], quals[p].value.to_s] }.to_h
        {
          id:          id,
          position:    posn.value.id,
          label:       posn.value.to_s,
          description: posn.value.description(:en).to_s,
          start_date:  '' # need _something_ here so we can key on it
        }.merge(qgood) rescue {}
      end
    end
  end
end
